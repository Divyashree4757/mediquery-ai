CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    symptoms TEXT,
    diagnosis TEXT,
    doctor TEXT
);

CREATE OR REPLACE FUNCTION nl_query(input TEXT)
RETURNS TABLE(id INT, name TEXT, age INT, symptoms TEXT, diagnosis TEXT, doctor TEXT)
AS $$
BEGIN
    IF input ILIKE '%fever%' THEN
        RETURN QUERY SELECT * FROM patients p WHERE p.symptoms ILIKE '%fever%';
    ELSIF input ILIKE '%age%' THEN
        RETURN QUERY SELECT * FROM patients p WHERE p.age > 30;
    ELSE
        RETURN QUERY SELECT * FROM patients p;
    END IF;
END;
$$ LANGUAGE plpgsql;
