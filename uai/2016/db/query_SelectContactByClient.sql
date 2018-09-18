-- Select the way of contact for client.
SELECT 
	Client.id_cliente, Client.nombre_completo,
	Contact.tipo_contacto, Contact.valor_contacto
FROM Cliente Client
JOIN Contacto Contact on Client.id_cliente = Contact.id_cliente
