Return-Path: <linux-kbuild+bounces-2232-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15491152C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 23:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C5728213C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 21:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A77681723;
	Thu, 20 Jun 2024 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n2EaCf9V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6E757E3
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920350; cv=none; b=W56IQbDsWV5e4Vj5PwSUDr6r5etYN5XxTBJXekFYAIMx1xqfXQ/D9uxNURDRlb8MwOWkEGf+/sK8FvO6PnGHZaZoIaF0z/qDJt9kVI7zIsgwYeqpObhW9IS/ucETNatTlOgiGykZIDadAO9x9OKj5ipWGkDDWr6eoBZ6hbMZQ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920350; c=relaxed/simple;
	bh=2FOyLV4GHpaRKVhoA1ma37Hm1gVaMz3AaJAjd68LFVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzlElXsUB56VcD1JEp7oNMmnAM6oNag3NeMJEwYyZMqRRocdRTiuC/ZllR8BfBY0WQmVUNG7rpzNlM9EjUiBNcAD77286ToQgCGJQk8f7A7kbCNJxHqa/W864MiA7RzVGFGsFilWtHf0FrZCO5OofkFrKCprzS/Urj8S4djsnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n2EaCf9V; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-713fa1ae9a7so939239a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718920349; x=1719525149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCL4DWciTGqSOmHD8n1CyNNo7VlBsdmCzTAXVKMjDJI=;
        b=n2EaCf9V/XTiE+7PDfrAFgWaKIHgsu5fp0f9YMuOMYOL15+jLpiQ+LeauGEYCoL/zv
         bXjN6iev56oCwlzPwsjMPmyouoNaRA0G+lEnsh+NT+ScSuYhTfeTZO/gByO+OTVEcpVN
         dJI+XQLw36tMy4Aa+L3HS+/RSfgGE+xv3AIN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920349; x=1719525149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCL4DWciTGqSOmHD8n1CyNNo7VlBsdmCzTAXVKMjDJI=;
        b=JctHg6LnsC2VRfxRNEsvli6w1LAXdY8MludsvEm8wdwODj6IDTyto2LTx+/VYWrPCJ
         4fJk7apyCgleVsBSORgOl27VUwvmNo5ROqiu2C/GypOpZAvlemX9DawG6LaErpcW8O92
         6YB/Yn0r35a/EUNdKhuMx2Y5XVMRj+ZaBMqZQhTU7B7pEoa5yeaDHA8ru9UuIeGtqMhv
         CnFcyA+IeRHYmylKgW7lkJOv2PqrHIN4x0PVrpkOwpdY92Pg/ioi3hMNeJoKMhG5afkV
         NraxNU1zwoxyAaTQPzMP1ZImWZyWBP03Jlrjf1t4rNbgj0jteBO9ToxpJcFORbs6liJ3
         AIww==
X-Gm-Message-State: AOJu0YyEUlmR6LQSSeleSd+dWDcZNDkDxE+x8qdWIwNjkU2OhMh03FX+
	SFQ4u8AKx6vD8LMPaPrqHr64TmzAuLYEqUtPvTi3pBcTCtx6WwyQc6TrhJ2HVI8jQqnSX98tH6Y
	=
X-Google-Smtp-Source: AGHT+IHzj7E2DV9mWLZX2bC2IeG9DDRDVXzNRRvfAMdRITbMPcicfgr6+OovcGC2P61uVydjRIhiOw==
X-Received: by 2002:a17:90a:db86:b0:2c7:7e23:63d8 with SMTP id 98e67ed59e1d1-2c7b5d905dfmr6708191a91.44.1718920348710;
        Thu, 20 Jun 2024 14:52:28 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:3c9c:a224:3ec6:17d2])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c819a79ff4sm168294a91.17.2024.06.20.14.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 14:52:28 -0700 (PDT)
Date: Thu, 20 Jun 2024 14:52:26 -0700
From: Brian Norris <briannorris@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] Makefile: add comment to discourage tools/* addition for
 kernel builds
Message-ID: <ZnSkmmpCY2Aj5VpU@google.com>
References: <20240619062145.3967720-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619062145.3967720-1-masahiroy@kernel.org>

On Wed, Jun 19, 2024 at 03:21:42PM +0900, Masahiro Yamada wrote:
> Kbuild provides scripts/Makefile.host to build host programs used for
> building the kernel. Unfortunately, there are two exceptions that opt
> out of Kbuild. The build system under tools/ is a cheesy replica, and
> is always a disaster. I was recently poked about a problem in the tools
> build issue, which I do not maintain (and nobody maintains). [1]

(Side note: I hope I haven't placed undue burden on you; I understood
you don't maintain tools/ and that it didn't use Kbuild. I only "poked"
you because the original bug report I was replying to had you and
linux-kbuild on CC already. And I appreciate your engagement, even if
the bugs are due to intentional forking.)

But anyway, I agree that clearer documentation and recommendations could
be helpful here. To that end, some dumb questions below, as I'm not sure
if this fully serves its purpose as-is:

> Without a comment, somebody might believe this is the right location
> because that is where objtool lives, even when a more robust Kbuild
> syntax satisfies their needs. [2]
> 
> [1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T/#m8ece130dd0e23c6f2395ed89070161948dee8457
> [2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 471f2df86422..ba070596ad4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1331,6 +1331,11 @@ prepare: tools/bpf/resolve_btfids
>  endif
>  endif
>  
> +# README
> +# The tools build system is not a part of Kbuild. Before adding yet another
> +# tools/* here, please consider if the standard "hostprogs" syntax satisfies
> +# your needs.
> +

Some clarifying questions / statements-as-questions:

* nothing in tools/ uses Kbuild, right? (even stuff that uses KBUILD_*
  names is just an imitative port, right?)
* not everything in tools/ is actually promoted to a high-level target,
  that affects this top-level Makefile. Are you only concerned about
  stuff that pretends to be integrated in the top-level kernel Makefile?
  (If not, then it seems like placing the README comments only in this
  Makefile is a poor choice.)
* is the "standard hostprogs" recommendation a general recommendation,
  for all sorts of kept-in-the-kernel-tree host tools? Is the
  recommendation to "use Kbuild" or to "avoid putting your tool in
  tools/*"? Is it possible (recommended?) to plumb Kbuild stuff into
  tools/, even if other parts won't migrate?

As is, I can't tell if this is telling people to avoid adding new stuff
to tools/ entirely, or just to only add to tools/ if you're able to
remain completely isolated from the rest of the kernel build -- as soon
as you want to play some part in the Kbuild-covered part of the tree,
you need to use Kbuild.

If I'm inferring the right answers to the above, then maybe an improved
wording could be something like:

"The tools build system is not a part of Kbuild and tends to introduce
its own unique issues. If you need to integrate a new tool into Kbuild,
please consider locating that tool outside the tools/ tree and using the
standard Kbuild "hostprogs" syntax instead of adding a new tools/* entry
here."

It's possible I'm playing mental acrobatics here in my reading too.

Either way, I think this is a good trajectory:

Reviewed-by: Brian Norris <briannorris@chromium.org>

Regards,
Brian

>  PHONY += resolve_btfids_clean
>  
>  resolve_btfids_O = $(abspath $(objtree))/tools/bpf/resolve_btfids
> -- 
> 2.43.0
> 

