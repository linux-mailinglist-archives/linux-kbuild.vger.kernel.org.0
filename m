Return-Path: <linux-kbuild+bounces-3130-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A351295905A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 00:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332162814F1
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 22:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F444176252;
	Tue, 20 Aug 2024 22:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+t6rd8t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896929D19;
	Tue, 20 Aug 2024 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724192132; cv=none; b=pKQBLL2YWg/yTVxgvigoaGDG34rYcrdKeawfuhXZGwWPyGLltGCvZzjCqy1laALlYZwcMoAmFlGLWllbe5EBY8cAbKAJdwfTI6jtiLJ+u6pJR8YchWEJ1IBFM7jENe1yoF2L/lotEOCz2gxkOh1vq2/fgui94NW4ArmzeTfvRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724192132; c=relaxed/simple;
	bh=goPlmJcLq9q5J/ImjfipoY5mwvvKZvMhSe5xf5G422M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGL/ijcurcjVbq4BWb2HFn8UH0mtGDUsk8anuI4wbJbNka1wMWMw/9kiv6EC2vJBgxKbhuwoJe+OECe3I1KiwRJ3dXuZMMKWmCw4zQwTncoBqp5zR0CyAndrCFjz5ifrA7f60yTFnCL2yyUnXcqphlf+jv1+bjI8bwrkXMBIt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+t6rd8t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1C9C4AF09;
	Tue, 20 Aug 2024 22:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724192130;
	bh=goPlmJcLq9q5J/ImjfipoY5mwvvKZvMhSe5xf5G422M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+t6rd8tAM5N9tkBqJCe3hG9rdTUZjXZX0jjEintBG7xQfasHV4kQAaLYeEOY8s4d
	 hGCLyZt1vJYtQQ/+/vj5iM0UmU82f5L5MMnjv6iJsS40wru/iXD/eziUz9yv6mxiaF
	 AHOteuZnkKeO9dUOOOsKjszZTHGhLo9Ym4VvnB1FZVsjKLbR7Ae5xlIl0KOuvDiG9r
	 ThlWGZ1G1EpwP6wGrfVADr/GXc1GE8xDLfha5cnqKMegLcklIuqiUk7IMX2VWQzrne
	 M1Aj8ouK1XgDsynU0mWDzUdxpFy0LnD2tMtMrPU6OrRnS1AWkG0QtENndG6LcDxcVF
	 OZT5MGdgcToWA==
Date: Tue, 20 Aug 2024 15:15:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 1/1] Documentation: kbuild: explicitly document missing
 prompt
Message-ID: <20240820221528.GC2335251@thelio-3990X>
References: <20240820171000.1656021-1-stephen.s.brennan@oracle.com>
 <20240820171000.1656021-2-stephen.s.brennan@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820171000.1656021-2-stephen.s.brennan@oracle.com>

Hi Stephen,

On Tue, Aug 20, 2024 at 10:09:46AM -0700, Stephen Brennan wrote:
> There are a few lines in the kbuild-language.rst document which
> obliquely reference the behavior of config options without prompts.
> But there is nothing in the obvious location that explicitly calls
> out that users cannot edit config options unless they have a prompt.

Sure, I think the mention of "non-visible symbols" plus "no prompts
anywhere" in the select section is both a little cryptic to people who
are not pretty familiar with Kconfig and slightly disjoint from the
prompt section, so some clarification and expansion would not be a bad
idea! I do have some suggestions for the wording below.

> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 1fb3f5e6193c3..8e9306b599cd3 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -54,40 +54,43 @@ applicable everywhere (see syntax).
>  
>  - type definition: "bool"/"tristate"/"string"/"hex"/"int"
>  
>    Every config option must have a type. There are only two basic types:
>    tristate and string; the other types are based on these two. The type
>    definition optionally accepts an input prompt, so these two examples
>    are equivalent::
>  
>  	bool "Networking support"
>  
>    and::
>  
>  	bool
>  	prompt "Networking support"
>  
>  - input prompt: "prompt" <prompt> ["if" <expr>]
>  
>    Every menu entry can have at most one prompt, which is used to display
>    to the user. Optionally dependencies only for this prompt can be added
>    with "if".
> +  If a prompt is not set, then the config option cannot be changed by the user.

Would "not present" be cleared than "not set"? It might also be worth
calling out here no prompt means a "non-visible" symbol since you
brought up the document brings that term up and does not really tell you
what it means.

Perhaps something like this might be just as clear while being
consistent with the terminology? Feel free to disagree though!

  If a prompt is not present, the config option is a non-visible symbol,
  meaning its value cannot be directly changed by the user (such as
  altering the value in ``.config``) and the option will not appear in
  any config menus. Its value can only be set via "default" and "select"
  (see below).

> +  It will not appear in any menu, and even edits to ``.config`` cannot alter it.
> +  It can still be set via "default" and "select" (see below).
>  
>  - default value: "default" <expr> ["if" <expr>]
>  
>    A config option can have any number of default values. If multiple
>    default values are visible, only the first defined one is active.
>    Default values are not limited to the menu entry where they are
>    defined. This means the default can be defined somewhere else or be
>    overridden by an earlier definition.
>    The default value is only assigned to the config symbol if no other
>    value was set by the user (via the input prompt above). If an input
>    prompt is visible the default value is presented to the user and can
>    be overridden by him.
>    Optionally, dependencies only for this default value can be added with
>    "if".
>  
>   The default value deliberately defaults to 'n' in order to avoid bloating the
>   build. With few exceptions, new config options should not change this. The
>   intent is for "make oldconfig" to add as little as possible to the config from
>   release to release.
>  
> -- 
> 2.43.5
> 

