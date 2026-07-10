Return-Path: <linux-kbuild+bounces-13986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id epU+IrbEUGoz4wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13986-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 12:08:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2226739779
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 12:08:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13986-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13986-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F37CA30719C8
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 10:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF183FD96E;
	Fri, 10 Jul 2026 10:05:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD63F44C4
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 10:05:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677910; cv=none; b=l/HRzzj/dPWLHfLId0HBeS7Jx0IDG8QxjVRvG9v3ksVqcCvxzvr64LjmQz6lsQV+Kzgip24v2aHQ18PDiFLLtv6ztbp3ZhFZ5Vg9CkPWuHoF/GQPMq09bPLhZNcr/YR7duJ3BCfhaCHUn/et1A8YCuwCRC0T9piN6++TIcEIbVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677910; c=relaxed/simple;
	bh=Akkf3kL+PsQe7xmYXgLVaSqFrB61iytAQiQ6WDcfnyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5y0Ah0DDXYnqu7OtDqzSvB9w0zCEVF4UfWY5t/qC1spz7N4mLVolk698fURlfKRmRwhrQGwIiMfNBKS8Yb7NpvEEXbDaQNUuNPQ/Gja6Og5SMpLIXdhWMi4qsqr+z3bmcHO6azJ2EmM+3AoRup99EeTeStZqSD6SHg0c/EWc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bdff8c02b2so320433e0c.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 03:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677908; x=1784282708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CIBplsIuVz8rQQd1I0ICk9drRx4a3WpiYxfYnZ5Bfk=;
        b=fDlTL8CbOpFRJbnQKJ32y6C9T8CSBf0RxWJPaLToBVMj4itSBCdUxdBaZDVzTgSjAR
         kfDni6pL5jUt7qLkNgnMo0ZCpDlaFOx5D9Dx5wBmL1hlkRg0LWKGlYjAPuVPXUuylGmM
         2MK6pLDOYTJ/6xvbvEI4BSAojZZvB+FrLt57aRyiChRWIirKGYtGfMuBFhgCcWDzbTf0
         h21f6K8hOCjq8gG6mwt4J3mujXxmi0UGZrx14y6xdz3Tw56CtwTKKBwW7EintZMTSMG7
         bzvwH/IPE5l3WvO9BfDORgVsjfc9SXXP67wfgYfpOCfgCt9Mv6E7yywxWyYvHtphGqBn
         8hXg==
X-Forwarded-Encrypted: i=1; AHgh+RoDwDoToYclshMOrbkxskt5aBiIyhdPkv6Hvxr+lcVvG4C0tF7Cbv0WNJb0k4O+MOZpYlfZ40MsCcu712M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybu6A22g8oVfj0tgy5hcp3mPId4a4zHE58P6xYzJV569Ohy5s7
	5GVGI5eOvxC1tNMM3urZ7sWeftjjpj+jIJIW/hEk8zERvgc4cJYDou36wVEDzXSAm8M=
X-Gm-Gg: AfdE7ck0v+k4N52zWnz4lBnW5/porc8wV/lk+4oolBb0Ea+Glcbim3g748NyoEWTJpq
	9i/Vngq06p91w1vKE2kpFqDqISBN0KW2vL9NdwvMtUTeaiFT2DQAHNMyOiuG+vpjmfbReiNCBm3
	JMKn363hFC1IfpEnkrNuwNdglGoAjA31rSvHMoTTKjipyNmUTsfLzKd7Os0F0t20s1F6ZZLSfuo
	fcvH7avR2VhbNyM8NZmJ2kZ1qHGoFORPtSDI87/Se6AvV4Z3auRBpx0yw6w8NJMhZKfQ/rXblIs
	jDMqBnhq8u/YyjCO03mjwfKvoJwWwY4GLDTiWYyj9lGr/PaGWb6WWwDv/ErxE3VsXEZWCXNwiZs
	upX2/mIxkuSAwNk+cLrxunmqE91N6XAnR226o/q3XFIk0sjRn5cp4tkBMpiwqQqrQceLaU6HgU8
	JLYJ/vRtSITo3fecxeFwk9CqZX9T3CGAwwVpkCcr2DkGlE2t4XKQT3A+2OFi6t
X-Received: by 2002:a05:6122:82a5:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5bf75edc9b5mr6119725e0c.14.1783677908289;
        Fri, 10 Jul 2026 03:05:08 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm5163181e0c.8.2026.07.10.03.05.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:05:08 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-728f9ecd56aso343592137.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 03:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rot3ngN90+pVJIx+fOVkcKIjDKkReZs21Sl6SmIGMJJr6zweSkbeugCn7Sg6IzzCqmWF3w/hO6BKBjfWrc=@vger.kernel.org
X-Received: by 2002:a05:6102:5605:b0:737:d2e8:d644 with SMTP id
 ada2fe7eead31-744e01af814mr5812204137.20.1783677907869; Fri, 10 Jul 2026
 03:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709163833.3851179-1-sashal@kernel.org>
In-Reply-To: <20260709163833.3851179-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:04:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCAX642tSJhvG_Ku6Y=D8GK3owbyed9qkhzPpgrU1kdg@mail.gmail.com>
X-Gm-Features: AUfX_mzFVzbeb8aPhbmCJAceFXYQjpxJuPF0DPyyv44pDz5k7_z7ZhaQ8shBBRI
Message-ID: <CAMuHMdUCAX642tSJhvG_Ku6Y=D8GK3owbyed9qkhzPpgrU1kdg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kallsyms: embed source file:line info in kernel
 stack traces
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Vlastimil Babka <vbabka@kernel.org>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Zhen Lei <thunder.leizhen@huawei.com>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13986-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashal@kernel.org,m:akpm@linux-foundation.org,m:masahiroy@kernel.org,m:mcgrof@kernel.org,m:torvalds@linux-foundation.org,m:richard@nod.at,m:jgross@suse.com,m:James.Bottomley@hansenpartnership.com,m:corbet@lwn.net,m:nathan@kernel.org,m:nsc@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:gregkh@linuxfoundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:kees@kernel.org,m:peterz@infradead.org,m:linux@leemhuis.info,m:vbabka@kernel.org,m:deller@gmx.de,m:rdunlap@infradead.org,m:laurent.pinchart@ideasonboard.com,m:wangruikang@iscas.ac.cn,m:thunder.leizhen@huawei.com,m:samitolvanen@google.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,nod.at,suse.com,hansenpartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,huawei.com,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2226739779

Hi Sasha,

On Thu, 9 Jul 2026 at 18:38, Sasha Levin <sashal@kernel.org> wrote:
> Changes since v6
> ================
>
> - Address Sashiko AI review comments.

What does that mean?
Please list the changes, so reviewers know what to look at.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

