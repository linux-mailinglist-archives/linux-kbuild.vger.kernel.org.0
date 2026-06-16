Return-Path: <linux-kbuild+bounces-13762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vteVKFJfMWrliAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13762-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 16:36:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BB6908F7
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 16:36:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=srcRDnwH;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13762-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13762-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 986CC30F4E03
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 14:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAA936D9F6;
	Tue, 16 Jun 2026 14:22:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49183624C1
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 14:22:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619735; cv=none; b=Lji8+CiRiEfnpBrpJCo2RSRw57ZHMFDB+6XMtVK40kXYE2Yt3icd8XbKtQqrcLWhYu3EAiHk7qSdDK9EJxafxhm3Ko3ufGgFmcjcx4LmcHcQOQlsnbMHplpff8J46Z6E4SXxW6O7njIZ+wJr49QmrYBS1f5Tp/FRZfQgUvEdFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619735; c=relaxed/simple;
	bh=CA5nnvkspGUyTEG8HxXRVVazyc5v2cKfqM0DPMwJ6Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tS1gX2vZSv1g40S3PPPc6opxFOmbza6IpjRQIg6vSHFT0r2Sg0XiXomVmXrS/qzSqoaslTekb500RSJYDj4GkNMT9oXgFlHnjp96lkcZUdcwzBpJyvS0ATq48ROFGwczWrs0XxmO/7lx/zcdfCykbQ+GuudZju6zrJqi2Jyf1rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srcRDnwH; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso43686815e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781619732; x=1782224532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hlgJdoH4I+7g281+Nqd5PThHYlDh2fBtSR189+cjOCE=;
        b=srcRDnwHagNIDelp/dm360BkJC4+dNV59gqeTl1AAIIviuS3XRUu4JQ3xkeHejlNWb
         IJ1B2yAF/s5XDUjoIlx6CCCSYY4N1N083X7NpJqb/8fAYybeF6m1EYvawVdzTEDXfSUs
         d1xKj0asBeHYcU1ls1SgHEJBEEvKCR6B4h7GViYpniOuqY4sVkjHDxAodu9Fuap2+sTA
         GdH9f6WwBkUC44HNlnhkOOS0rNmHnT/vI1Y51rXfgLi7RmwOmxmxrT052lHXX9cI706C
         Ihs3DEdqXlNlNvm8lFyqU7edMrzfz+nc4w2iZKOqBohbV1y56aSJkqhKM+85xyOwSit5
         sImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619732; x=1782224532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlgJdoH4I+7g281+Nqd5PThHYlDh2fBtSR189+cjOCE=;
        b=IhikgMaizWznR66rbdAWPcK2U0DJdUvNDURjVvwjHE4FAZmm6/Q8IYRUy794EkcVb/
         lkuRg/lf7ux8owpNUW953oWmDC6aQF2oozInMCyTV87Vx+PUTv9da4uArFvUFqfg2SZw
         HBI8ckt5G6rYhcSRd2z829iKmo32MlUkvTFYcvLGQZUt5jztTPcLHMaLx2DeA6B52azm
         fqQOX9hRScpRackqFR5YR8iO38fCoHN9S7Vcdnd4imp5DM1ZEDGACZ+qM84QbhRDbGgv
         UbWhZYug31VLvmJ9bTOCO15VhYd1djbcq2xr80iATI1Yl51EIoFUY1PVAu/1VllOGkRN
         UGbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R7x9fqnA+DOStJ566qXUnmjVNMFxF+qwWJMDZobaAMhUpErzr0zaOgDAXeCEQQ6rg7m9KNN18igFoKyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxYzfQX4DshO+/0iOsu09wegVSuVATIONH/Pbe2d6+XQ/ZVEql
	o47pd2If/KOlEIoFf43czCjuAzHtxq+xsS5XXodZeX7fzvErfkwFmGn0
X-Gm-Gg: Acq92OGIAdf+87rB3XTc2ZATxp13WKlB1gH9zN6I566NiSpaCiDBnNF4qkQ6gyGNt2/
	3BXmsrZYpra8dV4f52abryxpRFrQeAHFbi0S+TJMWwL83G8cc3VV23Ig3YPRkZRghg0gSm0qsj4
	BGbA0Y7TOWtZqFMPfqd8avGFu7lnNy3jZeQc+GACHTJAL0eg/D0n116AlbTO0a7lF99Q9HbjsUZ
	t0NqqzIeX02hh00NVR3pgVVxgNHZdrxpv8qAY8YYib1e/QSC3wvElcrCPKAmdBTJoCQBU5r4nFx
	j9GSi0FqHH9pmTrbOQ2yBM5lJ8SnkRIcF1l1ZzV9NPuFYd4yzFRyC0zfUm0hqRUcgkfPFqdSjXb
	d/1u/b+1dOGOm/40VQ/WZ8zH/E0uHtHHt8c2B4jhdR6a4FECj9U4jwyNAjjW+je5mb/cFxLj2Dx
	BrfcjsnObJdUt8rt7BGq7bxOd8zPwLTNlOCCjZVd3rA9Rcb5+KMxwUZrsOkdd90mEwIjuseVykp
	d1Rae/96ejNwUimSgY=
X-Received: by 2002:a05:600c:2d0c:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-492200dce50mr128613795e9.22.1781619731860;
        Tue, 16 Jun 2026 07:22:11 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2ce361sm43051695f8f.31.2026.06.16.07.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:22:11 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b3c2fecb-0aa3-4ab0-b7a1-c8b9985e028b@gmail.com>
Date: Tue, 16 Jun 2026 15:22:10 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ironic visualization in menuconfig for NTFS_FS vs NTFS3_FS
To: Xi Ruoyao <xry111@xry111.site>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Mingcong Bai <jeffbai@aosc.io>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <cbe95c15d2760f6fce8eaf207c969ce8fd3703aa.camel@xry111.site>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <cbe95c15d2760f6fce8eaf207c969ce8fd3703aa.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,aosc.io,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13762-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xry111@xry111.site,m:linux-kbuild@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:hyc.lee@gmail.com,m:jeffbai@aosc.io,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF8BB6908F7

Hi Xi,

On 6/16/26 10:24, Xi Ruoyao wrote:
> Hi,
> 
> In the Kconfig for NTFS3 we now have:
> 
> config NTFS3_FS
>     tristate "NTFS Read-Write file system support"
>     depends on !NTFS_FS || m
> 
> It basically means some sort of conflict between NTFS_FS and NTFS3_FS. 
> But then menuconfig is apparently puzzled to believe NTFS3_FS "depends
> on" NTFS_FS, and put NTFS3_FS as a subentry of NTFS_FS:
> 
>   │ │    <M> NTFS file system support                                     │ │  
>   │ │    [ ]   NTFS debugging support (NEW)                               │ │  
>   │ │    [ ]   NTFS POSIX Access Control Lists (NEW)                      │ │  
>   │ │    <M>   NTFS Read-Write file system support                        │ │  
>   │ │    [ ]     64 bits per NTFS clusters                                │ │  
>   │ │    [*]     activate support of external compressions lzx/xpress     │ │  
>   │ │    [ ]     NTFS POSIX Access Control Lists                          │  

This looks like a bug in menuconfig's behavior, as from
Documentation/kbuild/kconfig-language.rst:
"If a menu entry somehow depends on the previous entry, it can be made a
submenu of it."

And since Kconfig treats 'source' similarly to C's '#include' (the text
of the file effectively just gets copy-pasted in), it's like the config
options in fs/ntfs3/Kconfig immediately follow the options in
fs/ntfs/Kconfig since the sources are back-to-back.

You can test this by simply adding some other, unrelated config option
between the two 'source' entries that doesn't depend on NTFS_FS or
!NTFS_FS.

So, anyway, it seems to be simply ignoring the '!', and just treating it
as a dependency.
And you can test this by removing that dependency on !NTFS_FS, which
causes menuconfig to stop rendering it as part of the menu.

I think your workaround is okay (there are other similar 'NO_' config
options in the kernel), but it would be better to fix this menuconfig
bug.

- Julian Braha

