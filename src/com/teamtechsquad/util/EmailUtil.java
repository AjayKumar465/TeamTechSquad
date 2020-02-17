package com.teamtechsquad.util;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

public class EmailUtil {
	
	public static String concatenate(List<String> listOfItems, String separator) {
		StringBuilder sb = new StringBuilder();
		Iterator<String> stit = listOfItems.iterator();

		while (stit.hasNext()) {
			sb.append(stit.next());
			if (stit.hasNext()) {
				sb.append(separator);
			}
		}

		return sb.toString();
	}

	/**
	 * Checks if is collection empty.
	 * 
	 * @param collection
	 *          the collection
	 * @return true, if is collection empty
	 */
	private static boolean isCollectionEmpty(Collection<?> collection) {
		if (collection == null || collection.isEmpty()) {
			return true;
		}
		return false;
	}

	/**
	 * Checks if is object empty.
	 * 
	 * @param object
	 *          the object
	 * @return true, if is object empty
	 */
	public static boolean isObjectEmpty(Object object) {
		if (object == null)
			return true;
		else if (object instanceof String) {
			if (((String) object).trim().length() == 0) {
				return true;
			}
		} else if (object instanceof Collection) {
			return isCollectionEmpty((Collection<?>) object);
		}
		return false;
	}

	public static String randomPasswordGenerator() {

		char[] charArray = "abcedfghijklmnopqrstuwxyz1234567890!@#$%&*"
				.toCharArray();

		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();

		for (int i = 0; i < 10; i++)
			stringBuilder.append(charArray[random.nextInt(40)]);

		return stringBuilder.toString();
	}
}
