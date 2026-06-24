Return-Path: <linux-kbuild+bounces-13872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5fUaDS9PO2rCVwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13872-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 05:29:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC846BB192
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 05:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="BfuWpoc/";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13872-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13872-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EA6F300D7BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 03:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CF63033CC;
	Wed, 24 Jun 2026 03:29:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5D3090E2
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 03:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782271785; cv=none; b=QUvL/Sf5velNgDRfIagFIiZ6SdD1NxGGdW7EylucB+IxBge3Luwk8EHswI48b+7OzwuRMq9J9UM5nMYFCW7iBJteTLOaANaRVfCYNlivme0x9hHTdlapUi3eeM4xwoGgZwJW/eccWE5pURgcEBnSLkdK+oTcGa9V4n3Cc+VbnXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782271785; c=relaxed/simple;
	bh=92fG1n1bYXdYefIdInTjtnGSem9PN2uND/nqWvTsEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw3fhiPSZe/w+bzEabcd51xznI/ac11zA76FfQGpSLuO+SIn8YZS5e9udh/OWR1WGGmrp+H9+hcePpZxKG+PJN/uBwTrOBB7UYdn9h/hcwh7sPCuEYv93Z7W/KO8bv1+MN/BEwWYpITiAwLjuq9jf+WNTkLmsZ+9LtRrmb5aAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BfuWpoc/; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6be9cd7afso2476015ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 20:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782271783; x=1782876583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LYD3yx66xVkGVMCZniwPS1KBnJkI/qzLlmB1duD5OE=;
        b=BfuWpoc/CXFSJDIMo908YZNYIJCzEMbpyLYq38SbUUCDMCsftlPt5uCI3vHuRhII61
         VE6zE/0vxtqsXMlFdPVthd37FEK/owwySeulneG7mb1+Gfn/scRPHaf/+fv1AukxXUyT
         OZELNKGTQjWN5gXn7MKjPBmgtsH3wwMposTF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782271783; x=1782876583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LYD3yx66xVkGVMCZniwPS1KBnJkI/qzLlmB1duD5OE=;
        b=VYYa/pG7vdXZUpVsfx0Pivz4yo+fnJNTYc0Heoz+PckTpg4wao/eeW1xWwpNTMZhnL
         v1Aa1a2S3fCAD6Pnuzqy2T5Dj30bG0hdt/jZeGBF2WeWIQaCXAtVNqsuWPgaNr1y+u38
         qvV5h2SLh2eMbGUlfa8pSO14NA8HhlTlx7c+q3KJx7b8ywGcoylYtJhVvlkJqQO2fNNA
         ChdPq2AlIRKxGvkIz/aLVJ7d9OL15c+6CD9KDNxfpd4TrWgngSrEqpNHXVucBDDTerzM
         ar5uXPQTVuWk3jZuSVpbxWSngPsoWu87QiH/Z2I+GFqa2H9P+BVlccd1kbcGGlCkwdWi
         pH6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq6aB81ht2RedX8ih/bPu+f9HVDUL61YfxYeveuTcYGZ7AOpcmthaLzjfq47rD8pHgJkhPX1Y0kx/WzOq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ptkECS+lxMUqd571vSkjVgpe4a88a7bmIGq5fEyxPeWho1qf
	Xpi70GAxFrarVjC7oNtl2Z0j3a6CX3Cj/javHwtptRgv16BY+R4+VTyYvUkaCsTJWA==
X-Gm-Gg: AfdE7cknSdNhWvwrZWTgS3hfXkmI688m4mIroftVvuu/tDiiRwSexgmBz/9s254bi94
	q8dFyY7k/cpp+NpihyHCBcCEY4kgwoVjBOrc65HAGhYuKGr0MXsCtlFLEEKXN2YRcfP5OKmgijq
	6ji0wRwDbWiOgSDZgL5MWmL/7wqa0ARLIdu7F5bX6pnnyuEwspAZXp4y/E0cZ0ARcDz3hZxeqDI
	snadVD2ZbH0+p/5iIkajqLUizQ3uR46z1NHIw2//pzBl3JfGnMjPmJF0SdTWWBECSYu2JgABKAt
	oQuDbl0RFEYCpRkRLH/HjuFHBlDue5iRuuC0jsmPCEmOLbgtWPTpLFAt3sCxjdy0NsJgUr/T2cQ
	NEaslsC3YZSH3xnLVP3bEKl0SJhcjW/bP+rXiu5jNBOPWFt75KqfFHpXQZcWdCvQ6Z+PAtDZj0T
	FFv/mbG4Y3HaFJNzvuAIDJ9TwZaCeU66m2dTMSm3U1nJnd99zof2+T
X-Received: by 2002:a17:903:32c2:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c7e1595700mr16983535ad.20.1782271783638;
        Tue, 23 Jun 2026 20:29:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1287:5d13:b2d6:c6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe441sm122010915ad.62.2026.06.23.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:29:43 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:29:40 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, andriy.shevchenko@linux.intel.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org, 
	tfiga@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajtOv5l8nIWS-WeH@google.com>
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
 <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13872-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:andrew.jones@linux.dev,m:senozhatsky@chromium.org,m:andriy.shevchenko@linux.intel.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AC846BB192

Hi,

On (26/06/23 16:25), Julian Braha wrote:
> >> I wonder if you have seen KCONFIG_WARN_UNKNOWN_SYMBOLS which seem
> >> to be addressing the same (or very similar) problem (unless I'm missing
> >> something).
> 
> > Thanks, Sergey. I wasn't aware of this. Is there a way to combine that
> 
> The two tools do not do the same thing. One is a check on .config and
> the other is a check on the Kconfig spec.

Ah, I see.  I didn't check the code, obviously.

