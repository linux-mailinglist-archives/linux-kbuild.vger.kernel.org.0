Return-Path: <linux-kbuild+bounces-9441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE000C4146B
	for <lists+linux-kbuild@lfdr.de>; Fri, 07 Nov 2025 19:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A52B94EC13B
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Nov 2025 18:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99EB32779A;
	Fri,  7 Nov 2025 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IawdOGL4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tl4J9ODk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IawdOGL4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tl4J9ODk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6B33A018
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Nov 2025 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762539988; cv=none; b=Onz4xNdBOf/BtCCsCb2qFRjybfaLcWAuVoWiLNV+9GvEGxh3fJdX43lgepCriL93mSWkgYLi0iqnyGhrIPGQvDPuQ9Fv8UenZALQtrKUFg2w821hNdntbosUgDHmNWpBJxJEWV12E7fu0y1hyO5fcVCTZ8mV2xudntfuZ/5cjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762539988; c=relaxed/simple;
	bh=jvbYArc15nbrVfu4R2JmIKRGTKF/VMiJCjpU7IAHFnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/599f+AOF44x3uyzGphORkHfkzUtDX69pM8PvP07vG4Oj+NiwFoB9CPLyDzNUNeSCFMsiavTigz6G70mgsiCBa0eEc727MvM56LNzZVv2+pSSE52FUcO3BaH3nVWSxgCiN1TMcIlFlZSmbeNMn8xWuq3OJyJmmGJhmA1eB+l7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IawdOGL4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tl4J9ODk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IawdOGL4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tl4J9ODk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7839F22268;
	Fri,  7 Nov 2025 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762539985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1SyhaAjRQ5R12yDuRdW+dH0QxxJRrDf/1IK//JY7oU=;
	b=IawdOGL4sC4vw/Kq1b9zRGDZrK8zpv30QWKZHLipdPbsIx9mLJYmFTJzUdwH5lU+1QKjxD
	IjQAG3izJ/swox9QBz4KoJNzH9ZUBtCfakP0eGW7REM8251ihazWPqUKEf2KAstupRLe5e
	gZjNbvx0CH253PgZYXCrDhQ6yJalm4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762539985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1SyhaAjRQ5R12yDuRdW+dH0QxxJRrDf/1IK//JY7oU=;
	b=Tl4J9ODkwbfY7wHaQweK8uHB3GgGyKSo1bWdSClVsgIum8X3Rt+i8zfW5w6BrZXJN4It8T
	xz7NboNm0WY3wWDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762539985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1SyhaAjRQ5R12yDuRdW+dH0QxxJRrDf/1IK//JY7oU=;
	b=IawdOGL4sC4vw/Kq1b9zRGDZrK8zpv30QWKZHLipdPbsIx9mLJYmFTJzUdwH5lU+1QKjxD
	IjQAG3izJ/swox9QBz4KoJNzH9ZUBtCfakP0eGW7REM8251ihazWPqUKEf2KAstupRLe5e
	gZjNbvx0CH253PgZYXCrDhQ6yJalm4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762539985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1SyhaAjRQ5R12yDuRdW+dH0QxxJRrDf/1IK//JY7oU=;
	b=Tl4J9ODkwbfY7wHaQweK8uHB3GgGyKSo1bWdSClVsgIum8X3Rt+i8zfW5w6BrZXJN4It8T
	xz7NboNm0WY3wWDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D2871395F;
	Fri,  7 Nov 2025 18:26:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yYCTCNE5DmkZGQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 07 Nov 2025 18:26:25 +0000
Date: Fri, 7 Nov 2025 19:26:24 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Linux Documentation <linux-doc@vger.kernel.org>,
 linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251107192624.78b8a8cf@endymion>
In-Reply-To: <20251107071342.52ed6437@sal.lan>
References: <20251103131419.5e504ae2@endymion>
	<20251103185609.GB672460@ax162>
	<c0e4a0b0-b7c9-491b-ada3-74945fb2e3d9@infradead.org>
	<20251107071342.52ed6437@sal.lan>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 

Hi Mauro,

On Fri, 7 Nov 2025 07:13:42 -0300, Mauro Carvalho Chehab wrote:
> Please notice, however, that kERNEL_DOC env var is also called at some
> DRM makefiles. Perhaps the issue you're getting is there.

I'm getting the warnings from a simple "make" call with W=1, and for
pretty much all C files, not just drm drivers. For example:

$ nice make CC=/usr/bin/gcc-8 PYTHON3=/usr/bin/python3.12 W=1
(...)
  CC      arch/x86/events/intel/core.o
Warning: Python 3.7 or later is required for correct results
Warning: arch/x86/events/intel/core.c:0 Python 3.7 or later is required for correct results
  CC      arch/x86/events/intel/bts.o
Warning: Python 3.7 or later is required for correct results
Warning: arch/x86/events/intel/bts.c:0 Python 3.7 or later is required for correct results
  CC      arch/x86/events/intel/ds.o
Warning: Python 3.7 or later is required for correct results
Warning: arch/x86/events/intel/ds.c:0 Python 3.7 or later is required for correct results
  CC      arch/x86/events/intel/knc.o
Warning: Python 3.7 or later is required for correct results
Warning: arch/x86/events/intel/knc.c:0 Python 3.7 or later is required for correct results

So without my patch, PYTHON3= is ignored for part of the build, and
these recurrent warnings make it difficult to spot other warnings.
Which is the reason why I proposed a fix. Alas, I see that my first candidate
fix breaks "make htmldocs" as reported by Nathan. I'll send a different
fix which doesn't seem to break anything in my tests.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

