Return-Path: <linux-kbuild+bounces-12398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PwtL3vsy2mlMgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12398-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:47:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6ED36C07D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81D04307A32E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975AB421EF3;
	Tue, 31 Mar 2026 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K5C8Xa1K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47752423A79
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971353; cv=none; b=QBkJmJCLG48PDtE3zlXIXz+ENqplyFPfntPc4SRAfPMjhpShoZ7yMPEtKTWzdN55rKkglfGrqIDStLswJV8oS/5S+9lHOn0xQPUTCdMxhsyE1KQ2pt68o95fkHCEAENjSLfVfCyfQmQ79obfSD0gX3lv2kjSzt1027JJm78mvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971353; c=relaxed/simple;
	bh=0WFog79zuDRJhn/p/fsZHmfoespawcmgR5YmcyH0GY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDIfA3LuHAIyJJUiRUBghpkNOS9+G6YX2Gm2BQB5ukpgxtPai9rbHu8Rtf/XOdjSZZMMkfe2YlIkc98WDkyzddL1zacv2o9Padkgod7Fpc/i73+TNJy3z69hnPRVrBMnYGcZcSASxW8iyJHbc55wLwc/fkr3CT4zDNB6RjuVB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K5C8Xa1K; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so639965f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774971348; x=1775576148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MiGvSf1cEKquv9AHWJHz+IKC+VcqOToPMsbHXtYmwWU=;
        b=K5C8Xa1KWejcZCUQIt3T0/O+JBPN3KCcwDpAMoU6ePRO1ZKXzOYVJHG8p7aoJAFIx0
         QFS6XToNcQtKJYlJdiPfxW6OFwoJFN2425pIorPD90+33JpuCEMhj3R/RLyz6ur5x2e8
         X1GUbm9wdnqc1ND/tD7mXvRi50mTjc2BUA6TGVVW905yRP8g40fSEjG7iidOv70JJCEM
         Ajr2cOz5rq+aaLf191KENgQZr27ouVCYl5ZEadY8LZZkmmDrAsVlb8VTDz8/g07x19y6
         3A+aBKdcCvhaluS69CrdQoPut/CPs+49FOlv9Hl2KN0IVjadfUaDWoQtfr98ONQ3l9En
         ttRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971348; x=1775576148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MiGvSf1cEKquv9AHWJHz+IKC+VcqOToPMsbHXtYmwWU=;
        b=GAEQs6J59faOfKidwDZyBZ93LznUOscX3OgKtwPFF8A7ZzQHRwKxWKr80E3dBgMXLS
         SQ9dENkYFnKQ9ZCdDp8O2KpGGf4mIA09gbUj6QHia24O4TcpsWrtd2TC9YGp7I3PueW7
         xse37bRMQfVlub6pkCU0mt8leLKZUWfR9YHOi4EYrSxACb8iVNZeCS/o0XC0w2f6KR19
         1R4YOubA/L8+OkoLOMVIrJvLjwnLDsFAQp67+gtTZPpvzXUdPO2D9oe7N3FumruEPTJW
         k8jbwo4hAGTNl1WKjUrQkCIwj8HMRJ0hhKnBhQF30m0bUVkACmmkVdfl8qiRU88JkqfI
         iRZA==
X-Forwarded-Encrypted: i=1; AJvYcCXPFldc7NO9XkHUwyiDn8C1Y8X78HnosvOnD3fi8uAeumu9FKczUteb4lcRgLhJ41PJEFTFo/O0Fh2dAUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKiRh8DKXBf/HWs9AoBdKXatzIO76BNSzaLGHB+xAV2PBvb7sK
	PKl7luD+bjv37iSNBv8KDuBpwc4c9ziLpmsn8VSn/K2ZJT/hwQnRDzsNDy7Dnakhz/s=
X-Gm-Gg: ATEYQzxnHeSSW5hvlYFdvUOtgqlIcJbR0ma2Kyr+xESRHBhUvW5tQXZ9maF7kI3rsyC
	Zao6kGWLt8zRE/62F9EArrDaMRB3/G5lmGpCW5dUHs/wee61rYUqxsw0GOmwPXNjmPe1dgg67pG
	KXar6S/RSKW7U52MczCr6oYb5jijjrRwc7QjSaHisD+UtcU0Usvfe5oy7WcPio5T9zilSLG8cS1
	BhDYklz8WdzKbOhy9RWKnB16QYGYReh01nAKKpm6oYKlUHtjF/4DEI6Gaxgb/iqtlLePAaXPujd
	eXWn7mNZGnH2D0LENnMwbx7I6ZpH24t4AJfxvz3akcYmkygVH2jKwmC/fVXdgDnelOPswyQFJ70
	NKsyk2BMHVS9r5n6Xbu4D+sid9cKUdIEgJfTj1PYbhnZNXD3pE4IMpj89ffeQzWW605lfnP+PUT
	lSBpdG41n5gCF3fnMKwqH1trUBOA==
X-Received: by 2002:a05:6000:4211:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43d1507620bmr185363f8f.14.1774971348197;
        Tue, 31 Mar 2026 08:35:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm23487555f8f.32.2026.03.31.08.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:35:47 -0700 (PDT)
Date: Tue, 31 Mar 2026 17:35:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init.h: discard exitcall symbols early
Message-ID: <acvp0HFv3o_i9sa3@pathway.suse.cz>
References: <20260331142846.3187706-1-arnd@kernel.org>
 <acvghO4glmZamFSZ@pathway.suse.cz>
 <82bc9a6f-2184-41fa-af8a-5cf50ac04f44@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82bc9a6f-2184-41fa-af8a-5cf50ac04f44@app.fastmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12398-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,vger.kernel.org,linux.intel.com,gmail.com,google.com,infradead.org,suse.com,atomlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 4F6ED36C07D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue 2026-03-31 17:01:20, Arnd Bergmann wrote:
> On Tue, Mar 31, 2026, at 16:56, Petr Mladek wrote:
> > Adding module loader maintainers into Cc to make them aware of this
> > change.
> >
> > On Tue 2026-03-31 16:28:38, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> Any __exitcall() and built-in module_exit() handler is marked as __used,
> >> which leads to the code being included in the object file and later
> >> discarded at link time.
> >
> > Is this safe for dynamically loaded modules?
> >
> > Honestly, I am not sure what is the exact efect of this change.
> > The dynamically loadded modules just came to my mind...
> 
> In a loadable module, using __exitcall() directly already discards
> the function at link time, so there is no difference from built-in
> code. Actually using __exitcall() here is a mistake regardless
> of my patch.
> 
> Using module_exit() in a loadable module still behaves as before,
> this uses a different macro, which already has __maybe_unused:
> 
> #define module_exit(exitfn)                                     \
>         static inline exitcall_t __maybe_unused __exittest(void)                \
>         { return exitfn; }                                      \
>         void cleanup_module(void) __copy(exitfn)                \
>                 __attribute__((alias(#exitfn)));                \
>         ___ADDRESSABLE(cleanup_module, __exitdata);
> 
> so this is also unchanged.

I see, I was confused because cscope pointed me to:

/**
 * module_exit() - driver exit entry point
 * @x: function to be run when driver is removed
 *
 * module_exit() will wrap the driver clean-up code
 * with cleanup_module() when used with rmmod when
 * the driver is a module.  If the driver is statically
 * compiled into the kernel, module_exit() has no effect.
 * There can only be one per module.
 */
#define module_exit(x)	__exitcall(x);

and I missed that it was the variant for the built-in modules.

Best Regards,
Petr

