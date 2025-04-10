Return-Path: <linux-kbuild+bounces-6571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E29A9A84AC4
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 19:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E62DA9A4249
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 17:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F371F09BF;
	Thu, 10 Apr 2025 17:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="YhVO7C0V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFE51F03C5
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Apr 2025 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305316; cv=none; b=szlrGt1w9mqcLZgZxN2nbY72HqfFDe/WbFTPv1jIvAcTa4fwuVH3zsENqoqj1+Zs07OT7LNsrMzRqJkgkRe0dbWWN/136ATqfUtGysQjh1BebIDxgZF7eyMooZ17suhYDjjWD/UXv4M7augLZJ7z7EcboUmTcH9LtfFSPWwk+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305316; c=relaxed/simple;
	bh=5ALi35vEit4jVHRzo8LeambbTx8yrl8l/InF5c4WZFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJpbnLiBzHeJUlhAf4bnLmUQQIAJ0+zS+Q+yw0BJ1ZXpgl87fjGACQYIckXOFT9DdHOMO5HG4y1SiyqKmm4Y7IG7xePxYUL2jAxZjUUD5Ci1rXSA7V05LFGaBTFhgqnY8PD2IcgLwkm+KmgrgN7pRzC++7y3NF33sRQrqjFFYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=YhVO7C0V; arc=none smtp.client-ip=45.157.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZYR5N2RkVzRrv;
	Thu, 10 Apr 2025 19:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1744304712;
	bh=99/RXn0MLXP28oZE7oH//4zXPYGjhypiJ2KEDAnW5jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhVO7C0VCVvGv88HbYg1tzpR68jC1nUpEH4nZu9RLIEdBnfWuR31wMGRNxygWgat4
	 521h/Iqu0TWwGaapfFXgJiNZU9W9F+5fTN0LmIcreCktxLw4Za9Ioq/a8kv5C6Owyc
	 LqfdaNEhYLjB63V/PuQNZzBabLv92RIpOgmvON5k=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZYR5L4hcJz8vc;
	Thu, 10 Apr 2025 19:05:10 +0200 (CEST)
Date: Thu, 10 Apr 2025 19:05:09 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: WangYuli <wangyuli@uniontech.com>, gnoack@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, kees@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-security-module@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [Bug Report] A compilation failure occurs when landlock and
 RANDSTRUCT are combined with GCC 14.2.0.
Message-ID: <20250410.Ahkoo7ihae8a@digikod.net>
References: <337D5D4887277B27+3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>
 <20250410.926dbc57c00b@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410.926dbc57c00b@gnoack.org>
X-Infomaniak-Routing: alpha

On Thu, Apr 10, 2025 at 05:33:21PM +0200, Günther Noack wrote:
> Hello!
> 
> On Thu, Apr 10, 2025 at 04:11:15PM +0800, WangYuli wrote:
> > [ Compilation failure log: ]
> > 
> > *** WARNING *** there are active plugins, do not report this as a bug unless
> > you can reproduce it without enabling an
> > y plugins.
> > Event                            | Plugins
> > PLUGIN_FINISH_TYPE               | randomize_layout_plugin
> > PLUGIN_FINISH_DECL               | randomize_layout_plugin
> > PLUGIN_ATTRIBUTES                | latent_entropy_plugin
> > randomize_layout_plugin
> > PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
> > PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
> > security/landlock/fs.c:In function ‘hook_file_ioctl_common’:
> > security/landlock/fs.c:1745:61:internal compiler error: in
> > count_type_elements, at expr.cc:7075
> > 1745 |                         .u.op = &(struct lsm_ioctlop_audit) {
> >      |                                                             ^
> > 0x7f27fa6bdca7 __libc_start_call_main
> >        ../sysdeps/nptl/libc_start_call_main.h:58
> > 0x7f27fa6bdd64 __libc_start_main_impl
> >        ../csu/libc-start.c:360
> > Please submit a full bug report, with preprocessed source (by using
> > -freport-bug).
> > Please include the complete backtrace with any bug report.
> > See <file:///usr/share/doc/gcc-14/README.Bugs> for instructions.
> > make[4]: *** [scripts/Makefile.build:203: security/landlock/fs.o] Error 1
> > make[3]: *** [scripts/Makefile.build:461: security/landlock] Error 2
> > make[2]: *** [scripts/Makefile.build:461: security] Error 2
> 
> Thank you for the report!
> 
> This is in my understanding a duplicate of the discussion in
> https://lore.kernel.org/all/20250407-kbuild-disable-gcc-plugins-v1-1-5d46ae583f5e@kernel.org/

Yes, a new patch has been submitted:
https://lore.kernel.org/all/20250409151154.work.872-kees@kernel.org/

