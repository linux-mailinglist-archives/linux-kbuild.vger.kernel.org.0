Return-Path: <linux-kbuild+bounces-8201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3AB12B8B
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 19:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BA9F1C20825
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1A81A8F84;
	Sat, 26 Jul 2025 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GVwjk8Ic"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2D288A8
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Jul 2025 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753549242; cv=none; b=GwJtcSsO1NhvEhmeSgshT16IonktPdcuqgD+xtL1vhJMiYAHUytcGVE26kv6IllZur+urRp2MOPjPrRN2qPufSSysLvsdvgGH7OHNUOhXxKYKYaR9AXoZtsoaFM4ZdNxfhzzrIgIaVWVLMj0SGKHb8Qb3XE9+6oj+Wywd9ZEa3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753549242; c=relaxed/simple;
	bh=R07J6bkjhjT6i/0jxtUp3hBAq9wNaqh+KyJKh5jtddU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqN7UD6DuClloqPLubDA4hVLBB6gD+EmpS00K4zNyC7qGCWIm3fXy/a5KbEK5p1AhjMvyjUYubt2cHAvpOCjzPAD48/cOZcv+I8oo8U/bc2siNFbjyWyYaUjh8Geg6R3SQmeMvOkKo9c3l1ovN4PqZoepr8OWn55+sRzMdw8zmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GVwjk8Ic; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 26 Jul 2025 18:59:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753549224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnjjPvDjOsBciAEbE2Ojfe57Z/ziM2G9SS6lDwcFEaQ=;
	b=GVwjk8Icb6Ou2dMLcC7KX9TK3p0rw9e5KAG1jwSQ1YB2Aou8Ks8++Ek4tadVY5/KrZLtEI
	+7qUbSa11ahc0sdmFWKpszo7/NyIYAl8Ol06LcPLf7J6VhzVWlRkon4urUNCYj90Vr49Tf
	hR0+pY7DAOojBQgNsVFOTZM7FIfs+FM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in
 inputbox.c
Message-ID: <aIUJTK4JOxo0lDv0@fjasle.eu>
References: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
 <20250725-violet-mayfly-from-heaven-bd66d2@l-nschier-aarch64>
 <CAO9wTFiYRb8RDB9cTRsC3yqa6Zja5+QWuew1AZyZs5gPxbdVGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9wTFiYRb8RDB9cTRsC3yqa6Zja5+QWuew1AZyZs5gPxbdVGw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 25, 2025 at 08:06:35PM +0530 Suchit K wrote:
> > Did you compile-test this?  strscpy() is not available for user-space.
> >
> 
> Hi,
> Apologies. I didn't compile the change earlier since it was just a
> replacement of strcpy with strscpy, and I completely forgot that I was
> working with userspace tools. After seeing your comment, I tried
> compiling it and I encountered an error. Would it be more appropriate
> to use memcpy or strlcpy instead in this case? I'd really appreciate
> your guidance on the correct approach here. Thank you!

For the concrete code I'd use strlcpy, for some other uses of strcpy in
scripts/kconfig/ I'd probably choose differently.

As Franko already wrote: it would be nice if you could also send patches
for the other strcpy calls below scripts/kconfig/.

But please always compile and test your changes.

Thanks and kind regards
Nicolas


-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

