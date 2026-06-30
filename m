Return-Path: <linux-kbuild+bounces-13909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id snT8OmrUQ2oMjwoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13909-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 16:36:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2B6E57D0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 16:36:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CzW8yS7w;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13909-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13909-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAEE63086249
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 14:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C7A368D4B;
	Tue, 30 Jun 2026 14:32:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864A523D297
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2026 14:32:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829944; cv=none; b=eUEpi8gw44YEq5na7cx7wJA8WVsmyEBxcQo+SARP4FgNRoMXJbcl4vD/rr0Qiq0Pn8q9d0AEdOsweI4ezllHn7P0k5mbLqbwakHSbPqqhVwP8PDh8AEdfMscv5E6FTKUEbFxZlAUvgvjnxysIlTsye6mkvayoFIMlerqEH2hoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829944; c=relaxed/simple;
	bh=FO39T618gaKZFOsDIKxtn/AnCl/b10UY/y33rpdMYeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUNKcbX7MlRRPz03D+xqTOrNslH/trMV17Q6dl8Epu4/MvkmV8RssN/s7Q/cCO1As+/oaJJiRzWnW9pfKk5IOV1tqHyThooCZIDGxF6VlLjoI0OE71krp5Uemm0K8BqzSqRUgZV27k11Tz0jy76tw0pAO7kiE3AIa/z33HKuPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CzW8yS7w; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c12758e75afso269017366b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2026 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782829940; x=1783434740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLhtMkzKlXBCIs0wHZ4RXzVDwMqNrV52tXHwDJGZiCs=;
        b=CzW8yS7wBiT4nrRQMu7pNPnANuMYbywu4X9fs/W9/TG7De6bDmXp8yaCQTYiFpkuMQ
         w/lcPDMtKlLbjMM8ayQTGWkFGkgy8GHLuXf6lzeQwozoE0bh+XO2HglLqc4X2YwkD71C
         oUq79XAM4OIL8EVyrj4tkWeLURMeHbnd9kEt6F8CZlotgmwot/tPbUKZxhoAv+wjNByB
         oa4SJP2robSL680cxgm6WGILTEAhhOLi6j/P0TyfLDlj4/wEo/TP07RR7U2/Z+Nkpw11
         Zpcq0petBXBSslsG8dY4UKDr1FQglAnKbTlyAAJlUgiZNgtJ/upAFfOt35HYQkid45FW
         /+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829940; x=1783434740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kLhtMkzKlXBCIs0wHZ4RXzVDwMqNrV52tXHwDJGZiCs=;
        b=XIlRiTKNE/zHMexuU8txei3E9fAT5rbEtT7D4qRk/bsGAhMI/tWz5m+u/e+GK4n6bO
         j7yquQjZcAOO1+xYdERvxMrnvCtQJSiWKH2EffVQVZ90UNiXIYXAJ5HzIinYrWeFGMrB
         l4XrGHs1QhzglAWyxS76yURqoVZs+WOeURYdoHKKvbJtFQ3U0YqeiHTQIIIvlTvjTlf5
         WKTp6yKaMDREE/73F76w60c87XjIwATIFuiWxMt7Zyele7mj7dIEyK0JiofRHtz4kjcP
         aL0LqAiMwqksEIxWueh6qNbRxf4TGYh/C58cEn20UxRhDxrmmwVdzEQ2d6HuieRq0qtU
         WjPA==
X-Forwarded-Encrypted: i=1; AHgh+RrI19dpMFEP4Wc+ZJzNBhltjZg/SYJpZNcZ6GwQBBJNbDlD45sQT+o5LPkHobieKyuD9rfW4lYJEo6I+Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/tfHy2hhJ+HXnefBvIXwhbDIXB7wXCMTQgjB3dq9yH9cwvS1
	osnKVMn7kSnHV7b/ugITSDZXnDViuScx5GTD1rbk+J4YSL9Ah3Q2IWPFzSITGVb1WgA=
X-Gm-Gg: AfdE7clOAFTw6aDGm3Wx3psKTri+zOx9wPz+mQMW2SBqilIOXYRMgF7e0vlAogGEBs7
	pF2VMC02sjdHkXrvZ6/1ygby6MCGikRp60TARLE86tf0AYoL9oNq0K2W9yWgA0Yjd/RTCjNukDf
	+50D+A3cTVbg6eIIWuwg2b9VDD0faOZWUIhxm+O92r+aemufiuVZ+tuzi5E52ZU8sMffso6bOZO
	Y5dyOmxwje13qyadfeuhZFJBk6gYNarjwTfh+V4T43SLmC7QcocEJTWPBgqD5p1xcp70DYCj1V2
	ldGsO/lPOw/tF+eVTzw0vGJ+PL97UdxyCY2K2H1/nzQAA2vqR9YRi4RwBF9pPd4XLYrYcFstLHl
	uc/4+TFP9nbJAMKkj/kN19/P7wIwhxejZ2hCjT1INmAmOzmVKskRPA+xwNg6/FGPTqnsYZjXFyG
	x9FmFmy/yMSL6fhIE=
X-Received: by 2002:a17:906:2b50:b0:c0d:2ab6:806c with SMTP id a640c23a62f3a-c128726756dmr164000166b.33.1782829939666;
        Tue, 30 Jun 2026 07:32:19 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-476792758aasm477614f8f.11.2026.06.30.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:32:19 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:32:16 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zelin Deng <zelin.deng@linux.alibaba.com>
Cc: Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, live-patching@vger.kernel.org,
	mpdesouza@suse.com,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] selftests: livepatch: unset sub_make_done in case top
 level Makefile be overwritten
Message-ID: <akPTcJjrIAI1ZNyH@pathway.suse.cz>
References: <20260525083721.27857-1-zelin.deng@linux.alibaba.com>
 <alpine.LSU.2.21.2606191638540.26638@pobox.suse.cz>
 <ccfed9b6-9a73-4299-b305-da7b593a52fd@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccfed9b6-9a73-4299-b305-da7b593a52fd@linux.alibaba.com>
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
	TAGGED_FROM(0.00)[bounces-13909-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:zelin.deng@linux.alibaba.com,m:mbenes@suse.cz,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:live-patching@vger.kernel.org,m:mpdesouza@suse.com,m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pathway.suse.cz:mid,alibaba.com:email,suse.com:dkim,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68C2B6E57D0

Added some people involved in "filechk_makefile" feature into Cc.

For the new people, see the whole thread at
https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/

On Sun 2026-06-21 22:36:24, Zelin Deng wrote:
> 
> 在 2026/6/19 22:42, Miroslav Benes 写道:
> > On Mon, 25 May 2026, Zelin Deng wrote:
> > 
> > > After I did: make kselftest-all in top level of kernel source tree, top
> > > level Makefile was overwritten by auto generated contents by
> > > filechk_makefile:
> > > [root@emr: /home/shiyu.dzl/linux-next]$ cat Makefile
> > > export KBUILD_OUTPUT = .
> > > export KBUILD_EXTMOD = /home/shiyu.dzl/linux-next
> > > export KBUILD_EXTMOD_OUTPUT = /home/shiyu.dzl/linux-next
> > > include /home/shiyu.dzl/linux-next/Makefile
> > > 
> > > Top-level Makefile export sub_make_done=1, leaks into unrelated re-invocations
> > > of the top-level Makefile when recursive descent through selftests -
> > > building test_module of livepatch. That causes KBUILD_EXTMOD setup to be
> > > skipped, which leads to a relative/absolute path mismatch in srcroot vs
> > > CURDIR, falsely setting building_out_of_srctree, and ultimately overwriting
> > > the source tree's Makefile with a generated stub.
> > > 
> > > Clear sub_make_done before re-invoking the kernel Makefile.
> > > 
> > > Fixes: c4bbe83d27c2 ("livepatch: Move tests from lib/livepatch to selftests/livepatch")
> > > Signed-off-by: Zelin Deng <zelin.deng@linux.alibaba.com>
> > Adding Marcos and KLP ML.
> > 
> > I cannot reproduce and I do not understand it much from the changelog (I
> > am by far not a Kbuild expert). Could you share the exact steps to
> > reproduce please? If I just run 'make kselftest-all' in the top level, it
> > passes and livepatch test_modules are not even touched.
> > 
> > Miroslav
> 
> Thank you for replying.
> 
> Per my understanding, to build livepatch test_modules KDIR must be either
> set explicitly when doing 'make kselftest-all
> KDIR=<path-to-kernel-build-dir>' or have the kernel devel package installed.
> Otherwise the compilation could be skipped. (see
> tools/testing/selftests/livepatch/test_modules/Makefile)
> 
> KDIR ?= /lib/modules/$(shell uname -r)/build
> 
> ...
> 
> # Ensure that KDIR exists, otherwise skip the compilation
> modules:
> ifneq ("$(wildcard $(KDIR))", "")
>     $(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
> endif
> 
> ...
> 
> Here're how I reproduce the issue:
> 
> 1. pull linux-next, reset to HEAD, for example
> 3ce97bd3c4f18608335e709c24d6a40e7036cab8 (tag next-20260619)
> 
> 2. at linux-next tree: make all -j$(nproc) && make modules_install
> headers_install -j$(nproc) && make install && reboot
> 
> 3. at linux-next tree: make kselftest-all
> 
> 4. top level Makefile in linux-next has been overwritten by
> 
>     export KBUILD_OUTPUT = .
>     export KBUILD_EXTMOD = /home/shiyu.dzl/linux-next
>     export KBUILD_EXTMOD_OUTPUT = /home/shiyu.dzl/linux-next
>     include /home/shiyu.dzl/linux-next/Makefile
> 
> it is a stub generated by filechk_makefile.

It seems that "filechk_makefile" has reached mainline in v7.1-rc1,
see the commit c9bb03ac2c66bc5aa81b ("kbuild: reduce output spam when
building out of tree").

The commit message says:

<paste>
    The Makefile is now created even if the build is aborted due to an
    unclean working tree. That should not make a difference in practice.
 </paste>

It seems that is actually makes a difference in the livepatch selftest
case.

Sigh, the Makefile rules are a maze to me. It is possible that
we do something wrong in
tools/testing/selftests/livepatch/test_modules/Makefile. Namely
with:

ifneq ("$(wildcard $(KDIR))", "")
	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
endif

But I see "$(MAKE) -C ..." called in many other makefiles.

Best Regards,
Petr

> I'm not quite sure that it could be related to my toolchain (like make
> version ?), I briefed analysis the root cause on my environment (KDIR
> '/lib/modules/7.1.0-next-20260619/build' which actually a symbol link to my
> kernel source -> '/home/shiyu.dzl/linux-next'):
> 
>   1. sub_make_done leaks via environment. The top-level Makefile sets export
> sub_make_done := 1 after its first-pass initialization.
>   Because it is exported, every child make process inherits it.
>   2. livepatch test_modules re-invokes the top-level Makefile. The call
> chain is: top-level Makefile → kselftest-% pattern rule →
>   tools/testing/selftests/ → livepatch test_modules/Makefile → $(MAKE) -C
> $(KDIR) modules KBUILD_EXTMOD=..., which re-enters the top-level Makefile to
>   build an external module.
>   3. The inherited sub_make_done=1 skips critical initialization. The
> top-level Makefile's first-pass block (ifneq ($(sub_make_done),1)) is
>   skipped entirely. This block is responsible for correctly parsing
> command-line variables and setting up KBUILD_EXTMOD-related paths.
>   4. Path mismatch triggers false out-of-tree detection. With the
> initialization skipped, srcroot and CURDIR end up with mismatched values
> (e.g.,
>   absolute vs. relative). The comparison (ifeq ($(srcroot),$(CURDIR)))
> fails, so building_out_of_srctree is incorrectly set to 1.
>   5. outputmakefile overwrites the source tree's Makefile. Because
> building_out_of_srctree is set, the filechk_makefile rule fires and replaces
> the
>   real top-level Makefile with a generated stub containing KBUILD_OUTPUT,
> KBUILD_EXTMOD, and an include directive.
> 
>   Why make -C tools/testing/selftests/ all is unaffected: it enters the
> selftests directory directly without ever executing the top-level Makefile
>   first, so sub_make_done is never exported into the environment. When
> livepatch test_modules later invokes $(MAKE) -C $(KDIR), the top-level
> Makefile
>   runs its full initialization normally.
> 
> Thanks,
> 
> Zelin
> 

