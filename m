Return-Path: <linux-kbuild+bounces-5674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A064A2D546
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 10:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 209167A1D16
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F23192D8E;
	Sat,  8 Feb 2025 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="aB3vcaCM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CBC28F3;
	Sat,  8 Feb 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739007108; cv=none; b=WJrBq8E+4KAXb0CxrSJ8jzpjjVHPKPpVaHPC9CWbYor4wTPhG8aQfkA201yavjzR4YL3GtvOh7s5l6wbzHwthh1TEDn8SbvFqGizsyCCNRpqbVvVr1shcdcySyjhqexxNC1gILj360+lhZRnrVwNJS4KO3I+ZH40M8NqaqkAJYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739007108; c=relaxed/simple;
	bh=h510q3FTz/EfKQQ/Gq6Jz/spYjXtcFFEiPuXW73o+BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKjixuMpsRARRt5UggszvA87yyQsmdBAWv4srbRFd26F4tTkYiMWtiL9SveogLOXox2LuTgnmtwZl3YUJhP8k13Oi44Emr1+HGkgcAhzT6l5d8ACS7h877pzu0cP/7mEyYlYXy5eTO71ypQ88d4OwX6E9QaJ6e2FXlf+XmMSvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=aB3vcaCM; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4UjfwkAqrf80at/eRS3NicNTLlZLRIZjAZ7vXqnwqAw=; b=aB3vcaCM9eJ1G8wv9iUMa1Ey/B
	roSrhnEDl78UA+/2QJ9oIYbJxdGnQoMR0qFPzwjPSJo7Ff3Ft3SImRRjO9azwwvyJJzxxWgrblO/a
	sHR6WC4IxsD9hZ5Qp5b5q1l+0TFK4BLrKuPOGnXV0gLEApTcZI4R7amMfCyBB8R7bK5YRealq3o1I
	KI9FBWSpuf6Cd7v86gl6Mz2OX7wm5wJ0a1UFQvvWdP0tPm44PxIyGsyQR0vnhQb7BckUqvC3hO1U3
	j1PfNqtN3Sw/7Qc+P2Cpiyn+i6QZIIeDwGvd/g+PH0a/XGsA3aD7jql0F2LsBj8EDfLhN+y6vqJ7L
	H/2GUAcQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tghBV-005xdL-3Q;
	Sat, 08 Feb 2025 10:31:33 +0100
Date: Sat, 8 Feb 2025 10:31:31 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] modpost: introduce get_basename() helper
Message-ID: <Z6ckc-O_i-qtwvb1@bergen>
References: <20250207175024.412054-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250207175024.412054-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 12.9
Jabber-ID: nicolas@jabber.no

On Sat 08 Feb 2025 02:50:13 GMT, Masahiro Yamada wrote:
> The logic to retrieve the basename appears multiple times.
> Factor out the common pattern into a helper function.
> 
> I copied kbasename() from include/linux/string.h and renamed it
> to get_basename().
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/mod/modpost.c    | 41 ++++++++++++++++++----------------------
>  scripts/mod/modpost.h    |  1 +
>  scripts/mod/sumversion.c | 13 ++++---------
>  3 files changed, 23 insertions(+), 32 deletions(-)

Thanks.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

