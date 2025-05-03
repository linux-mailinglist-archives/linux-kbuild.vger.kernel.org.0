Return-Path: <linux-kbuild+bounces-6912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8FDAA81D5
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 19:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39540189F011
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 17:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522A7264F88;
	Sat,  3 May 2025 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdNJhVm6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBB199938;
	Sat,  3 May 2025 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746293160; cv=none; b=FtaIvkjdx9xjreN+YPU7zI9M6U5ym4ELRClpDBL2oQxh9bMJ4Xwb6vlO12QVUzVeFM3WntOet+qKQCjdpyunB1QiVAbfnq5gtsAEkOJBhAMbrAQI3vXi1OrYVCw3JvAc9I77IrRBWxG8RVJjsVWRww8CkZegMVmbgeuXO3lwV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746293160; c=relaxed/simple;
	bh=1aNojnjh6f9aU4lE8/vPeP3Xp57U1BRGOjwQrSWxDeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVcm6yOzoIvfRIg/ph+NSMIesC7pM9tiDHvKcJk5kdPGyQWgBAyutxd9yW30jVnP3q81YIA4gczhOWO53kb8watZcK7rM3hlBkYJhcdaDnn05xlLXSIM9Drr/ECa4aHKj/1X6cf9yRJwrVP+1XzN2XPgjtJtiJiRDXxNU7X2WZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdNJhVm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E39C4CEE3;
	Sat,  3 May 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746293159;
	bh=1aNojnjh6f9aU4lE8/vPeP3Xp57U1BRGOjwQrSWxDeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdNJhVm6jdIKAVlpABA8UMGIS8+VUrbTFo5CUu7dgwPhmWSYSYKfXJKKXj4K1S2g7
	 Uqs08o5DPnzAMA6R1xzjtUyDfs1gcOUs3kv6HcIjJAdxMxc8dcCY0hw29/r1F5V7mG
	 rDbTnKkslrFMEGYI8UeS5XgghGCc6pBWGbU5fmuz0Z1XUXDlxKLX6UqEC3p69eDtGg
	 QW7dcHB1Rs6aCsi9DHe8nImjWWi0OjTYSzTLxXRyERcHCshNiCU/b/zFaFQQ6hHXrt
	 5xgtnE6RDWzSaroCCZIUkb0w+na1w4fZhxnVxN1n5cnlTx/cwi1qLQuG/5t14gupN5
	 tGHSIclpEysNw==
Date: Sat, 3 May 2025 10:25:57 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v2 1/3] gcc-plugins: Force full rebuild when plugins
 change
Message-ID: <202505031023.BC44DC842@keescook>
References: <20250502224512.it.706-kees@kernel.org>
 <20250502225416.708936-1-kees@kernel.org>
 <CAK7LNATs4uHnNHgESXcUEjpONZra=GvkuHMaDwsx0hbyUGY99w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATs4uHnNHgESXcUEjpONZra=GvkuHMaDwsx0hbyUGY99w@mail.gmail.com>

On Sat, May 03, 2025 at 03:12:23PM +0900, Masahiro Yamada wrote:
> On Sat, May 3, 2025 at 7:54 AM Kees Cook <kees@kernel.org> wrote:
> > +quiet_cmd_gcc_plugins_updated = UPDATE  $@
> > +      cmd_gcc_plugins_updated = echo '/* $^ */' > $(obj)/gcc-plugins-deps.h
> 
> I think 'touch' should be enough.
> 
> If some plugins are disabled, it is detected by the normal if_changed rule.

I kind of likely having the active plugins show up in there, but yes,
"touch" is enough (it's what I started with originally).

> > +$(obj)/gcc-plugins-deps.h: $(plugin-single) $(plugin-multi) FORCE
> > +       $(call if_changed,gcc_plugins_updated)
> > +
> > +always-y += gcc-plugins-deps.h
> > --
> > 2.34.1
> >
> 
> 
> I think it is simpler to place the header
> in include/generated/.

I couldn't figure out how to do this, but thankfully you did! :)

> I attached my suggestion below:
> [...]
> -quiet_cmd_gcc_plugins_updated = UPDATE  $@
> -      cmd_gcc_plugins_updated = echo '/* $^ */' > $(obj)/gcc-plugins-deps.h
> +quiet_cmd_gcc_plugins_updated = TOUCH   $@
> +      cmd_gcc_plugins_updated = touch $@
> 
> -$(obj)/gcc-plugins-deps.h: $(plugin-single) $(plugin-multi) FORCE
> +$(obj)/../../include/generated/gcc-plugins-deps.h: $(plugin-single)
> $(plugin-multi) FORCE
>         $(call if_changed,gcc_plugins_updated)
> 
> -always-y += gcc-plugins-deps.h
> +always-y += ../../include/generated/gcc-plugins-deps.h

Aaagh, thank you! I didn't even consider trying ".." for targets!

Yes, this is SO much better! I will read your other replies and work on
v3...

-- 
Kees Cook

