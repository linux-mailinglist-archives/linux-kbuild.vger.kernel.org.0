Return-Path: <linux-kbuild+bounces-2131-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2A909240
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 20:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53A9E1F23632
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 18:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFDC19D07D;
	Fri, 14 Jun 2024 18:26:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C1B179BC;
	Fri, 14 Jun 2024 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718389584; cv=none; b=CvD/6LJVtSTOGesu4gIwoBA/We52aGOY4eBfWsMITS/rNM1jvsVmax/bbpoKKLuRvtSr4bjfp2vBQWjLsDmQc3iWxIRcXvlKnwmtZuhghHuvQ6z/DqKKn3Z76zwh9D0LxDVCUUKorlyMzMmFHahWqrgx98yuP86B7AzolJpWrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718389584; c=relaxed/simple;
	bh=jHAGhtBgYIhIH5h0XhykMYsCyNogbFyWVdwTe6RHoOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJ0Pdg6qW82ISx+U6Co5oO0Y0ipU6xlsZYC6Gomy9LxAwgBXVdcpGeWPXYjJO47HF1x622A7lI/QN7r499RszFmrTrfFh86Ti/4S0Abpj20g3q1QIQj200i05zL2oHjy9HOPjS8SLCpiu1WAw/7xZaeDYtmezUZFrnRQcalu1JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD416C2BD10;
	Fri, 14 Jun 2024 18:26:22 +0000 (UTC)
Date: Fri, 14 Jun 2024 14:26:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni
 <elena.zannoni@oracle.com>
Subject: Re: [PATCH v4 1/3] kbuild: add mod(name,file)_flags to assembler
 flags for module objects
Message-ID: <20240614142621.5ac455c8@rorschach.local.home>
In-Reply-To: <ZmyHsnXQoWgp7F2X@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
	<20240614171428.968174-2-kris.van.hees@oracle.com>
	<20240614134651.4ed2091d@rorschach.local.home>
	<ZmyHsnXQoWgp7F2X@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 14:10:58 -0400
Kris Van Hees <kris.van.hees@oracle.com> wrote:

> On Fri, Jun 14, 2024 at 01:46:51PM -0400, Steven Rostedt wrote:
> > On Fri, 14 Jun 2024 13:14:26 -0400
> > Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >   
> > > Module objects compiled from C source can be identified by the presence
> > > of -DKBUILD_MODFILE and -DKBUILD_MODNAME on their compile command lines.
> > > However, module objects from assembler source do not have this defines.
> > > 
> > > Add $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
> > > add $(modname_flags) to a_flags (similar to c_flags).  
> > 
> > You explain what this does but not why it does it.  
> 
> The first paragraph is meant to estabish the "why" (being able to identify
> what objects are module objects, even if they are compiled from assembler
> source).

Perhaps there's a lack of context. Sure, the cover letter can help in
this regard, but I always look at each commit as a stand alone.

> 
> As I mention, for objects compiled from C source code, those defines being
> present identifies those objects as belonging to a module.  For objects
> compiled from assembler source code, those defines are not present.  Passing
> them on the compile command line for assembler source code files for objects
> that are part of one or more modules allows us to identify all objects that
> are part of modules with a single consistent mechanism.

Sure, but why do we care? Again, if this was the only patch you sent,
it should explain why it is being done.

Perhaps something like: "In order to be able to identify what code is
from a module, even if it is built in, ..."

But what you are saying is just "C code has these flags, make
assembly have them too". Which is meaningless.

The other patches could use some more explanation too.

-- Steve

