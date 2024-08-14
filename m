Return-Path: <linux-kbuild+bounces-2979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827C895204E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 18:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E61CB22AA1
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 16:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937261B9B28;
	Wed, 14 Aug 2024 16:45:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A53FB3B;
	Wed, 14 Aug 2024 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723653937; cv=none; b=qLAk13CYsEtsnMoyKwNN8/ALtAA9tEOWlpxAVueDIf41aa3FMGJyOc8YHlHad+s8/RlHFJL3K7z3UzpzAFVtNRii/4kF6Ky/NOJB9Dlzt8S1z8pBvJckIbzZoogl1BJuaehpipz4fItlaj7uxJ4iFC8AcSHEV5E9JrR6YbR4o4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723653937; c=relaxed/simple;
	bh=JoxJjAhjxc5TKpVldN3/QH/WsBZng3l5SfBG4qvHUGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5szXTGMN8Z0QEnVxLe9XpQRFSCJDsuyLtIShBL3EgdcAVkZZPoqCLgrKRO/DtsT6XzKa1UAJqFF2pX8mrZEtS1Pa5Yao8zRgaNx9+X3mD1OQmeFNmQCdS4W6KGDFTmx+Gp3EcWPb0ObpQCcqzntd0Of8ts3Arjydev9KD2jScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E66C116B1;
	Wed, 14 Aug 2024 16:45:35 +0000 (UTC)
Date: Wed, 14 Aug 2024 12:45:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni
 <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 0/4] Generate address range data for built-in modules
Message-ID: <20240814124548.6e2cce78@gandalf.local.home>
In-Reply-To: <20240716031045.1781332-1-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 23:10:41 -0400
Kris Van Hees <kris.van.hees@oracle.com> wrote:

> Especially for tracing applications, it is convenient to be able to
> refer to a symbol using a <module name, symbol name> pair and to be able
> to translate an address into a <nodule mname, symbol name> pair.  But
> that does not work if the module is built into the kernel because the
> object files that comprise the built-in module implementation are simply
> linked into the kernel image along with all other kernel object files.
> 
> This is especially visible when providing tracing scripts for support
> purposes, where the developer of the script targets a particular kernel
> version, but does not have control over whether the target system has
> a particular module as loadable module or built-in module.  When tracing
> symbols within a module, referring them by <module name, symbol name>
> pairs is both convenient and aids symbol lookup.  But that naming will
> not work if the module name information is lost if the module is built
> into the kernel on the target system.
> 
> Earlier work addressing this loss of information for built-in modules
> involved adding module name information to the kallsyms data, but that
> required more invasive code in the kernel proper.  This work never did
> get merged into the kernel tree.
> 
> All that is really needed is knowing whether a given address belongs to
> a particular module (or multiple modules if they share an object file).
> Or in other words, whether that address falls within an address range
> that is associated with one or more modules.
> 
> Objects can be identified as belonging to a particular module (or
> modules) based on defines that are passed as flags to their respective
> compilation commands.  The data found in modules.builtin is used to
> determine what modules are built into the kernel proper.  Then,
> vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
> a modules.buitin.ranges file with offset range information (relative to
> the base address of the associated section) for built-in modules.  This
> file gets installed along with the other modules.builtin.* files.

Hmm, it's hard to parse the above. So the goal is just to make the
modules.builtin.ranges file? If so, that should probably be expressed at
the start, so we know right from the beginning what the result of this is.

  At build time, create the file modules.builtin.ranges that will hold the
  text address of the built-in modules that can be used by tracers.

That just makes it a bit easier to read the rest. I know I'm being a bit
anal on this, but jumping between several different patch series, is making
my head hurt. :-p

But now that I know what you are trying to do, it's now making sense ;-)

-- Steve


> 
> The impact on the kernel build is minimal because everything is done
> using a single-pass AWK script.  The generated data size is minimal as
> well, (depending on the exact kernel configuration) usually in the range
> of 500-700 lines, with a file size of 20-40KB (if all modules are built
> in, the file contains about 8000 lines, with a file size of about 285KB).
> 

