Return-Path: <linux-kbuild+bounces-13947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JTRcAt3sTGqQsAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13947-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 14:11:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D0171B3AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 14:11:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=d6kAw5Yc;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13947-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13947-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687223003EE0
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2026 12:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09733FC5CD;
	Tue,  7 Jul 2026 12:09:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630B37F011
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2026 12:09:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426155; cv=none; b=D2CZh2cgbnAsE1U410133jN4eWsK2DHzX7pIIOFeda78tSvuOBqFdM0SiZhtyzcnPLYH/rTgACKn44L5lLHqt0Zd1qOJdt3Cn5h/rf0rQexWf1eP+vJoJc7M/TIoRsGvMbKQrsJeVfW59RDaLA0QM2n/c5FxkAb4dpOU9+tJZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426155; c=relaxed/simple;
	bh=fVfYEpTNglhSvIyOmgIUD5maV4m+lUwPHrhZ1JTHkkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgd8tWLD5/TGJPLHTRT+62LmVp90toNZWMD93N/3arm2/qbf3DAqzK/jY+xcR0unOvZUCNNiXDVge/64rz03fHl2w6MbZtjmZOWJ5UNNGZHQx3GUGk5Md/mfr9CULE8REgrEEOwHWiUpMNtgdKg+sFltdpN96T3c6pS3gusvTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d6kAw5Yc; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so29408495e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783426153; x=1784030953; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgwFvt+gyf1i0Mk0Uq1bpXp9aJg14d/hFwx5zHvGmdg=;
        b=d6kAw5YcvGJqaFrxwr/7gHXtRCf1rVWfqX+Tfe+A+WRA6Aq8Qm2sM3JclgxDn0NFsr
         +sE2HTTjCRD1kLYTa9hZggdGW8QfZy8UrxWTMxcLymKG+/QX8a5K0xCxqEUCM/FVTZX3
         mJ8VzhaR+iREQoNrDbv4EchuG/rB741xMU4d8B0z/fk2TxfHcKRhXVmGLUf7dwnLCOJP
         93H8dhMSxNW2vyfLF1Jv2C+q2iNbTYiOd+LOdLVVzEp1Nt9CtIRAYT4RzVfSwrmso6KM
         gMH8QojV2I6YLUwlTTwAkvvA4JH4Lr/UxI0lkTOOyBIErng7889bGVZhDty8CMGD7UQ6
         wrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783426153; x=1784030953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YgwFvt+gyf1i0Mk0Uq1bpXp9aJg14d/hFwx5zHvGmdg=;
        b=JyyMrcetnYl9FC/JOy2rdDtTyHxa4PZct51ICqJdb8t+xEZvocf0KOtnT0HYwVYFkV
         gSqpw4KMVmOtmPo0gkMY94VSZvvbySwRsPwRr57RWjjNmFCSJKyyrq0hSRWlA2Ptyxj5
         JcVSh8Z/6i4gEvNM6fwRPDnwRpRDcgo+u97TbRF4/JftgP2bN7aaSBDOFSdCTiAFC11Z
         /WVQgjK1KGavNZozBAkg3waR5rvtgxcbvAtDpolXS8Oh858B/rJkR/150KlnGqJEq20n
         WSPFK5wzRcxAJiWyH/9EvgCKsGqK06uJq4Fa2RdRPH7OKMnDaRp75Y/dRQy5sie5cYES
         Pp/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq/VgMkqVGnyG2ho16BB1JBg9UtJK50enfbQnMwE7qOB2qQtlg875rBRViysCCQHZUj0MAj3+5jzxT78jw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2arM4eeLKApaXT537p3+7pK32iu3d+jaocnZPHLZeGcS+lIus
	+UBsX4AEDwyXzr1pb6Zgt2gyygTdzrGWxTr969WoXgCwQdKbCnXaVs23Zc5p8nGTDkg=
X-Gm-Gg: AfdE7clBrYqChuZzLEkIKpWx/awon26evXONG+4PaquIVHOEVb2n5FaVNASMLRur4Co
	sjtXRl85b6WoJ8gC7QHoG+3T08PCBvj0JZFSAXJpmZfx6sJBNSxdiy7qsJdvzmTLyiFQauODPBj
	Ggdjv9KLNpeblu6R8wqC8BZo9kJ31ForUuJpCG4cn6gKGh4oMOKAU0CFoJ5o7R67ofoSjYU36TK
	ISGU0KaZ+vSEI4UH6ZpO5fn55M0nNf+QeySxqcqGAHz5gjtLWWpmYoATtw+GKOfPYi0tefBftF/
	HXqTUsJQw7aAYuhK6GX/1Gmwv1lCqJkQS6HwfMcozASB41FON4xlCDm9wSEwcVUCWh5SoiSDPAJ
	VejYxs7WXroEJxABSFityXwiBao4oysWMYy+Qp9lc1NFrxL1XJWIdTOu9wjgaahykTBK7qes5GO
	PxgwO5EEwSe7ILvUMWlOR0BPaiQQ==
X-Received: by 2002:a05:600c:3b01:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-493df080c43mr49996235e9.22.1783426152919;
        Tue, 07 Jul 2026 05:09:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed08sm47614505e9.11.2026.07.07.05.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:09:12 -0700 (PDT)
Date: Tue, 7 Jul 2026 14:09:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>, live-patching@vger.kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akzsZqEg42GGJ0O2@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13947-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mbenes@suse.cz,m:live-patching@vger.kernel.org,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:zelin.deng@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,suse.com:from_mime,suse.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27D0171B3AF

On Fri 2026-07-03 08:04:08, Thomas Weiﬂschuh wrote:
> The kselftest build system may recourse back into kbuild when building
> test modules. In that case kbuild needs to parse the new flags passed
> from the command line, instead of using the ones inherited from the
> kbuild invocation.
> 
> Force that command line reevaluation.
> 
> The same was done for scripts/install.sh in commit 14ccc638b02f9ec
> ("kbuild: cancel sub_make_done for the install target to fix DKMS")
> 
> Reported-by: Zelin Deng <zelin.deng@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/
> Fixes: c9bb03ac2c66 ("kbuild: reduce output spam when building out of tree")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

JFYI, the patch has been committed into livepatching.git,
branch for-7.3/trivial.

The problem does not look serious enough to deserve rushing into
an 7.2-rcX. Also it is touching the global Makefile so it should
spent some time in linux-next. Let me know if you would prefer
to get it faster into the mainline.

Best Regards,
Petr

