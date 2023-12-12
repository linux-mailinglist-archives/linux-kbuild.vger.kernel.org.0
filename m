Return-Path: <linux-kbuild+bounces-345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4280ECEA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 14:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933301F215B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 13:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA036166A;
	Tue, 12 Dec 2023 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZsd9Sgx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qB5n7u3q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZsd9Sgx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qB5n7u3q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70CAA8;
	Tue, 12 Dec 2023 05:12:22 -0800 (PST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 038511FB45;
	Tue, 12 Dec 2023 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702386741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFfoLmv98r2NNTJcot2GCx6avTvSu3XvUhkt/4Goo/o=;
	b=DZsd9SgxbHOr1kIQj4Ysq6IB0aUH8X96Xfv1/ho8Wr+UnS6JOqii7w0F3dm+mDIMjXT/p9
	KFJ1J7P2MA7sKJavr30t4BgPwEed2Ek2r7fT1BY1F1ICRgElTXuV8S6jq+2CzouepLNcN3
	rnk7h4comPmc5bF3t4gOSjqFXyaKRLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702386741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFfoLmv98r2NNTJcot2GCx6avTvSu3XvUhkt/4Goo/o=;
	b=qB5n7u3qQTlJlDN47X6cQuY0HjP+xNgyuo0UO9evecfzd9gPHG2GQxNQtuqonQU1pRsojD
	/Ljg6MmkXMRTfsCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702386741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFfoLmv98r2NNTJcot2GCx6avTvSu3XvUhkt/4Goo/o=;
	b=DZsd9SgxbHOr1kIQj4Ysq6IB0aUH8X96Xfv1/ho8Wr+UnS6JOqii7w0F3dm+mDIMjXT/p9
	KFJ1J7P2MA7sKJavr30t4BgPwEed2Ek2r7fT1BY1F1ICRgElTXuV8S6jq+2CzouepLNcN3
	rnk7h4comPmc5bF3t4gOSjqFXyaKRLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702386741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFfoLmv98r2NNTJcot2GCx6avTvSu3XvUhkt/4Goo/o=;
	b=qB5n7u3qQTlJlDN47X6cQuY0HjP+xNgyuo0UO9evecfzd9gPHG2GQxNQtuqonQU1pRsojD
	/Ljg6MmkXMRTfsCA==
Date: Tue, 12 Dec 2023 14:12:19 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-modules@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] kbuild: rpm-pkg: Fix build with non-default MODLIB
Message-ID: <20231212131219.GQ9696@kitsune.suse.cz>
References: <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com>
 <baa3224bece94220dfe7173432143a91f7612c09.1701892062.git.msuchanek@suse.de>
 <CAK7LNARdnt0QXn6TRbuS_wzzMVXTY6NrCnu9WOM6PFztnyRmuQ@mail.gmail.com>
 <20231210210859.GN9696@kitsune.suse.cz>
 <CAK7LNAQo1p3dmdoqQRM_JxBp78Rxj5YpVqXGzMr5Xs9K-V3BiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQo1p3dmdoqQRM_JxBp78Rxj5YpVqXGzMr5Xs9K-V3BiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Level: 
X-Spam-Score: -1.60
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.996];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com,inai.de,kernel.org,google.com,fjasle.eu];
	 BAYES_HAM(-3.00)[100.00%];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

On Mon, Dec 11, 2023 at 01:33:23PM +0900, Masahiro Yamada wrote:
> On Mon, Dec 11, 2023 at 6:09 AM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > On Mon, Dec 11, 2023 at 03:44:35AM +0900, Masahiro Yamada wrote:
> > > On Thu, Dec 7, 2023 at 4:48 AM Michal Suchanek <msuchanek@suse.de> wrote:
> > > >
> > > > The default MODLIB value is composed of three variables
> > > >
> > > > MODLIB = $(INSTALL_MOD_PATH)$(KERNEL_MODULE_DIRECTORY)/$(KERNELRELEASE)
> > > >
> > > > However, the kernel.spec hadcodes the default value of
> > > > $(KERNEL_MODULE_DIRECTORY), and changed value is not reflected when
> > > > building the package.
> > > >
> > > > Pass KERNEL_MODULE_DIRECTORY to kernel.spec to fix this problem.
> > > >
> > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > ---
> > > > Build on top of the previous patch adding KERNEL_MODULE_DIRECTORY
> > >
> > >
> > > The SRPM package created by 'make srcrpm-pkg' may not work
> > > if rpmbuild is executed in a different machine.
> >
> > That's why there is an option to override KERNEL_MODULE_DIRECTORY?
> 
> 
> Yes.
> But, as I pointed out in 1/2, depmod must follow the packager's decision.
> 
> 'make srcrpm-pkg' creates a SRPM on machine A.
> 'rpmbuild' builds it into binary RPMs on machine B.
> 
> If A and B disagree about kmod.pc, depmod will fail
> because there is no code to force the decision made
> on machine A.

There is. It's the ?= in the top Makefile.

Currently the test that determines the module directory uses make logic
so it's not possible to pass on the shell magic before executing it so
it could be executed inside the rpm spec file as well.

OUtsourcing it into an external script would mean that the sources need
to be unpacked before the script can be executed. That would require
using dynamically generated file list in the spec file because the
module location would not be known at spec parse time. Possible but
convoluted.

In the end I do not think this is a problem that needs solving. Most
distributions that build kernel packages would use their own packaging
files, not rpm-pkg. That limits rpm-pkg to ad-hoc use when people want
to build one-off test kernel. It's reasonable to do on the same
distribution as the target system. The option to do so on a distribution
with different module directory is available if somebody really needs
that.

Thanks

Michal

