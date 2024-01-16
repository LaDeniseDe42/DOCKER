/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   auto_config.php                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/02 15:41:55 by qdenizar          #+#    #+#             */
/*   Updated: 2024/01/16 10:42:13 by qdenizar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

sleep 10
wp config create	--allow-root \
			--dbname=$MYSQL_DATABASE \
			--dbuser=$MYSQL_USER \
			--dbpass=$MYSQL_PASSWORD \
			--dbhost=mariadb:3306 --path='/var/www/wordpress'