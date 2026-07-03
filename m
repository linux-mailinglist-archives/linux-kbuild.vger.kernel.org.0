Return-Path: <linux-kbuild+bounces-13925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qQM0BAJ2R2peYgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13925-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 10:42:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B906700358
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 10:42:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=S0cPpTDn;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13925-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13925-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50E203194C61
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 08:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E1234C9A6;
	Fri,  3 Jul 2026 08:26:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D40346A13
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jul 2026 08:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067173; cv=none; b=PoJISP6K+cFR6FqYRNEIVGq3EgzUkoR6jwXzWJ2VOu4YpIJA0Okeqw/TyW8J9sGyNmyuCDATacqy1lbJ8OvFAC6ZJ6ZQm7BD0wo4ttD2x4RIt2K1z+HRXxsWV3u/WFzsHEmFAhehpoV24FrEsyX+NPosPcBiKNHZ6LB7APt6pM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067173; c=relaxed/simple;
	bh=XKI2pAfG7OX1O/DXM04l/YZndOsoqOzA948p9sxcHoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7fH1gi8QGylGbhKStyjidwKUg/MDTopqD5ExhTkIUyFV9iitLeiByOgZZ4Bdqzdd6h/ekL6ORBHdNl4n/GBJwBVedlQMzkjoMnVvqJjrATTEV3uuTkwR8p8N8jMYf7P7Q2WnMDzdkPe+AAJVGqzigvSaM1lDnJ9uDzmG4CAlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S0cPpTDn; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so1684705e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jul 2026 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783067170; x=1783671970; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi3rhvEIY7HPb2+WXJBWNBz8xP5NaPUV+FO6A/JpBpc=;
        b=S0cPpTDnY/bjqdlG6CvI1QWYPk5WPF2FxG4eJR8wwRsoNhViXn0w9GyWuFe//az0sy
         kHFQACYOK8imS6MyX6mTyKsKb9HOOjhnbc+HzOpILUw2F0lL7Wf+Ku/JoJ2oSH1ZPC3Y
         nVdC9E6StrdVwDFyd+MY8wpd993A+N46BN93Rv9TkT2JOa1ug1e1U/jr6Rb7+sayTzaJ
         /gI80KtGV5QxfK9xz9T2W58Yiq1aDV+CzEFVFi5LlWTP8bbEKIWK2iSpXYwueCfMGQBf
         stylJN1XLtC0U9Gy/IRbFfoMkbcKAViwIW0Z8dQkKH670y8b30IcuPIC76bpvn0tEutf
         b5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067170; x=1783671970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi3rhvEIY7HPb2+WXJBWNBz8xP5NaPUV+FO6A/JpBpc=;
        b=kcltoFInQd4fyjdLTlhvpvHPQnr03BxzTRO+EktqCnyMfYxfUIYhyoLv7R8oQFOAqQ
         /XkLbV3aSCAxT3YJ6ogSy8reg7Bm/NhiCC1cqYE1iRW/TaGyXHV5AL/+nw5/f9eIJgDC
         8fKU2rcawTRMZnXkrfx3lZYNybQbpL2wEteFPn/tzVk3MSXOjreK4jMZq+D4Qm+abG7y
         zApZ6jEJ6XlvsRpPbNa2BsPOalC6Ap74/LJHbkqKnwyIIUhSbkB57AsAA3c8NN4HsaXT
         eJOES5tZa0AZkSxbvlqb/dpZQfNQco1gDpK6sFK+NaxzY86sGBTPsb+OUsC+fUXs3umc
         cEGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WiawNwa3hKZtK6TFLThaCf4QOX6Kev6YjBZNx3OrlJxwAfcLsCtjEr1PSk5o+e6wOPdJTjyjssJ6M8Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtQREKAJrad4x7ARMUDFSJy1x3fMm0k0MwLty4K8YmYL6pG2t
	+PNk/NQhXUDXb78bZQQVk07st0UahA8acyqFFqOQDApU4n2N0LYvc8N+C1Z1+MvS840=
X-Gm-Gg: AfdE7ckGb4mAarkur1IIVlP3wY+FmsjTR9g8RC8BnFc5vyzd32//1e4hHIrU/ciEH6p
	kq+DY+EMD7Z1XGwuKfXEITBB8VRKKu3DUlAYDtQDvFsl+8yQbHQtyE0FU/F/oyN987xHYCPDlDM
	HK3Xs6OBePdF21Xkuan41Q0sd8HNRiyNyXOsLn721drhHH3xDJr08NhzSAhPKDCO0/9FoEpRYbs
	mm4eDe5W6miJ3c4MMPpBfMQ4nGE9KPKHdO1ycfiqatwNe/K4TxW4tfah4pktxTLquE/4DxNBa9F
	6qgVnuH+3OS5iC1NR0u0niqqM3H9MuZqjevGK42tTZLPG3OvXlQmyZRnykwC6mmH5iNcqdWam7J
	E8/WGNoB/f1P6gg0Ac6nyL1wGTa0Eph2IeV7hrJfapNutp3b1uj+xG78ZOORQxF3xIIjMtGBI8Q
	/wNHGybUHdcQgsjoo=
X-Received: by 2002:a05:600c:8718:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-493c845bc60mr60654815e9.4.1783067170178;
        Fri, 03 Jul 2026 01:26:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm50659555e9.13.2026.07.03.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:26:09 -0700 (PDT)
Date: Fri, 3 Jul 2026 10:26:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	shuah@kernel.org, Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akdyH7rRV1WHtBJ3@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703061449.246801F000E9@smtp.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13925-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:nathan@kernel.org,m:nsc@kernel.org,m:live-patching@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:mbenes@suse.cz,m:thomas.weissschuh@linutronix.de,m:shuah@kernel.org,m:zelin.deng@linux.alibaba.com,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linutronix.de:email,pathway.suse.cz:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B906700358

On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> --
> 
> commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> kbuild: unset sub_make_done before calling kselftest build system
> 
> This commit unsets sub_make_done before invoking the kselftest build system to
> ensure Kbuild reevaluates command-line flags when building test modules. It
> mirrors a previous fix done for scripts/install.sh.
> 
> > diff --git a/Makefile b/Makefile
> > index b9c5792c79e01..f717a4dc96d6a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> >  
> >  PHONY += kselftest
> >  kselftest: headers
> > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> 
> [Severity: Medium]
> Will make tools/selftests still fail after this change?
> 
> The tools/ and tools/% targets in Makefile delegate to the tools build
> system, which can also trigger external kernel module builds (like bpf_testmod).
> 
> Because sub_make_done is not unset for these targets, invoking commands like
> make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> 
> Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> consistency across the build entry points?

This might make sense. I see that the tools: and tools/%: targets are
defined right above the kselftest*: ones. And they are even advertised
in "make help" or "make tools/help".

Well it probably should be done in a separate patch. It would be better
for bisecting potential regressions. Thomas, Zelin, what do you think, please?

Best Regards,
Petr

