Return-Path: <linux-kbuild+bounces-9210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E5BEBB81
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 22:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1241A4E424E
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 20:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA371271441;
	Fri, 17 Oct 2025 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCZiRoRz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB9A25A2A4;
	Fri, 17 Oct 2025 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733991; cv=none; b=K6n0OYjwJMmel6VpchJk/d1PKkOdKAzRw0SkvwQqkDAA0fmSNruByAGre5Zkx4a2xpj0Sea8wUdaLp/ko+7rgaHn20Hq6w8V2y1Awk8LUoz6lcy9kv047RPt8NgPIeORnXXfIo3HnOLBVt/dw7hrCKZ8uAzCktUm9pW8BG4qHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733991; c=relaxed/simple;
	bh=Z+ATUnj51MZXhjOSQrJlClW/K6A5QSHNjjw183z2+9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKR2efe6BD38p98jhnTrXFm+qrizf5JNRKTjBTGoFKh9Jf+SFxKkYgzpHYhEdt2Dk5a4/SJceHdoxxSDdLqTV/M1WBvohZjjxGHrZQoqFx2rz7JSybFbiz0LIEcomj3ip4kb+m9doraISSC6OW97QVgxlNDqGfxFgOaBY2sTh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCZiRoRz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB92C4CEE7;
	Fri, 17 Oct 2025 20:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760733991;
	bh=Z+ATUnj51MZXhjOSQrJlClW/K6A5QSHNjjw183z2+9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCZiRoRzkQQ8z/+LYgDtaYVVo5TWrSOFy+C+K/Zy1r115hT1xTaqBKjZMSstBndxe
	 lTupfoymnqclZvt9XmyaSstr+XpNPLzC2o/1XBbLpRMs0oecMic3mXu5e3QTf52gKJ
	 Lv6VvXKkxsVUeutL+P9tS62/9R/V/Fsf2RdZ8viB7+JWxyc0e7iupIu0SiF9Il4tHl
	 pnnFMOeaLgsxcL6On9MXlqDL3/xxNNJSLhf4OuFEGq/xLu2B/HhaNLKutHBk7/UGvI
	 u7jfuEKybqvJm+J18FbsIlpMyZi25TmMpo1VZ15GFzgF2ES6RD/cCKuK2Sek2mSzz+
	 5NCIo822DI1HA==
Date: Fri, 17 Oct 2025 22:22:32 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for
 modules
Message-ID: <aPKliHl3k26RO0YJ@levanger>
References: <20251015203842.618059565@kernel.org>
 <20251015203924.731213165@kernel.org>
 <20251015231928.GC3943617@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015231928.GC3943617@ax162>

On Wed, Oct 15, 2025 at 04:19:28PM -0700, Nathan Chancellor wrote:
> Hi Steve,
> 
> On Wed, Oct 15, 2025 at 04:38:46PM -0400, Steven Rostedt wrote:
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 542ba462ed3e..6f909979af91 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -28,6 +28,12 @@ ccflags-remove-y := $(CC_FLAGS_CFI)
> >  .module-common.o: $(srctree)/scripts/module-common.c FORCE
> >  	$(call if_changed_rule,cc_o_c)
> >  
> > +ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),"")
> 
> Drop the "", nowhere else in Kbuild appears to do this.
> 
> > +cmd_check_tracepoint = ${objtree}/scripts/tracepoint-update $<;
> 
> Please use $(objtree) to be consistent with the rest of Kbuild.
> 
> > +else
> > +cmd_check_tracepoint =
> > +endif

The else part is not required, cp. definition of e.g. cmd_checkdoc in
scripts/Makefile.build.

Kind regards
Nicolas

