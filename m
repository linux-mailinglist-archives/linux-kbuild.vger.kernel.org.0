Return-Path: <linux-kbuild+bounces-4575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354E9C208A
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 16:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2AEF1C235AB
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 15:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E2521A704;
	Fri,  8 Nov 2024 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fkp3jlgi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468811E7C26;
	Fri,  8 Nov 2024 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080162; cv=none; b=UbOgtXL32c0EO3lT6uLkROCQ2IAu/2Fl14HUeEj5euh2KEKIDlL+oNNkW6r+iBw59suI1RU5Dy4aQixLYwQNWHdZGFNmuFDbqZTzmbP1ZrI6FQEX0PqZcrzrFIswmn4CkO33JwzxGQT9KtXdjUzqP7/IDzi1wuXl0mfKrl2bQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080162; c=relaxed/simple;
	bh=QExG4NDsxjbsTLEl19jIfnnUFsqMFMBIfd5uio9ziSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvkp6xQ3EmtzQZZpRFbezsAqCKziBL8t6HQtL4uH5oDZe1DE7cNeVNHGbDXxWsUxF/Hz4eymSBpH6G5IsrCtIFKYS7O7/k4C00OQXnWw2hcMaw2dhPI/u9RRoJM7FU9kXOQctmtCDNje+2zUht0MmpcMohrJONIUysm6tU/YPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fkp3jlgi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UUyC20fNhhkhzInM/OGGWK6MVOeNblQhVx2KgLllH5Q=; b=fkp3jlgi8a6K58qPHPaGO1mahB
	PVW+rxV1+YGM8mPpIIZ0M6LmjQ15TwiU6dSMMVTVXKGufyujL5RVH1pk+U78XqUwwIi30ufaJbS3X
	iJG6Woj8Kgwjk1btLYUwYFQF6NB9nyE7kp7Q0keH3X/oRQcZTYi6FU322t8kXgw4h5/hTv+DAMTpG
	Kc1hazttu8vN4umnYAUBSODU2PlaFLNeb+Qgzi9TBJgEWM72cf7kbA1eMnX/BKi0AvObSYsYOenX8
	Mnhg9zsR2Ei6DWuTgjBauFX0dhixPdgWetjTInRJ+tzFdJRLCxwzdVgO6UAEo0jZF/KgQnMRIuvoi
	QuVZ8enw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R1d-0000000CKR3-22yc;
	Fri, 08 Nov 2024 15:35:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9ED713006AB; Fri,  8 Nov 2024 16:35:52 +0100 (CET)
Date: Fri, 8 Nov 2024 16:35:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: mcgrof@kernel.org, x86@kernel.org, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <20241108153552.GD6497@noisy.programming.kicks-ass.net>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
 <04F6A88E-FC15-4184-A1F7-A5EE443997DD@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04F6A88E-FC15-4184-A1F7-A5EE443997DD@zytor.com>

On Fri, Nov 08, 2024 at 04:28:58PM +0100, H. Peter Anvin wrote:
> >@@ -1700,11 +1715,7 @@ static void check_exports(struct module *mod)
> > 		s->crc_valid = exp->crc_valid;
> > 		s->crc = exp->crc;
> > 
> >-		basename = strrchr(mod->name, '/');
> >-		if (basename)
> >-			basename++;
> >-		else
> >-			basename = mod->name;
> >+		basename = mod_basename(mod->name);
> > 
> > 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> > 			modpost_log(!allow_missing_ns_imports,
> 
> I presume this only applies to code compiled as dynamic modules, not compiled into the kernel?

Yes, the built-in modules get the regular linker to resolve relocations.
Nothing much we can do about that.

