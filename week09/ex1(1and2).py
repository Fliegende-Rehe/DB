import psycopg2
from geopy.geocoders import Nominatim

# Connect to the database
con = psycopg2.connect(
    database="dvdrental",
    user="postgres",
    password="password",
    host="localhost",
    port="5432"
)
cur = con.cursor()

# Retrieve all addresses containing the number "11" and with a city_id between 400 and 600
cur.execute("SELECT * FROM address WHERE address LIKE '%11%' AND city_id BETWEEN 400 AND 600;")
rows = cur.fetchall()

# Create a geolocator object
geolocator = Nominatim(user_agent="geoapiExercises")

# Update the address table with longitude and latitude values
for row in rows:
    try:
        location = geolocator.geocode(row[1])
        longitude = location.longitude
        latitude = location.latitude
    except:
        longitude = 0
        latitude = 0

    cur.execute("UPDATE address SET longitude = %s, latitude = %s WHERE address_id = %s;",
                (longitude, latitude, row[0]))

# Commit the changes to the database
con.commit()

# Close the connection
cur.close()
con.close()
