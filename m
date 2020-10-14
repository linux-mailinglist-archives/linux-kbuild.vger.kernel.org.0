Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6254B28E342
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Oct 2020 17:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgJNPZo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Oct 2020 11:25:44 -0400
Received: from one.firstfloor.org ([193.170.194.197]:36894 "EHLO
        one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgJNPZo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Oct 2020 11:25:44 -0400
X-Greylist: delayed 520 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Oct 2020 11:25:43 EDT
Received: by one.firstfloor.org (Postfix, from userid 503)
        id 3DE1B86865; Wed, 14 Oct 2020 17:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
        s=mail; t=1602688622;
        bh=lck1LuufIBM08kr6f8nMZydijZUoUFzj7ULXVQX9vZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qCbCansOUz92qlcokuAWL7zxb95GWk3z0DH2xYt+LXJfeTF357kz4p5UqiZdheRUE
         4ZR0jtzDgObeRz7fbceJ6QtaqYMVdc0+aa8GTWH8zKpfgvBaVBhYKUeZVOQqUdjzVJ
         +rk/sA3Hd8Jsy7Ukxp9rKelJaCk8N7qROdNftueQ=
Date:   Wed, 14 Oct 2020 08:17:01 -0700
From:   Andi Kleen <andi@firstfloor.org>
To:     Mark Wielaard <mark@klomp.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Ian Rogers <irogers@google.com>,
        linux-toolchains@vger.kernel.org, Andi Kleen <andi@firstfloor.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH] Only add -fno-var-tracking-assignments workaround for
 old GCC versions.
Message-ID: <20201014151701.vl3gh5e5teb2hqj7@two.firstfloor.org>
References: <CAP-5=fUT-1-CR-KMMsrpzgw9b3nBooeY05=YU9XKa5enO9SK+A@mail.gmail.com>
 <20201014110132.2680-1-mark@klomp.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014110132.2680-1-mark@klomp.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 14, 2020 at 01:01:32PM +0200, Mark Wielaard wrote:
> Some old GCC versions between 4.5.0 and 4.9.1 might miscompile code
> with -fvar-tracking-assingments (which is enabled by default with -g -O2).
> commit 2062afb4f added -fno-var-tracking-assignments unconditionally to
> work around this. But newer versions of GCC no longer have this bug, so
> only add it for versions of GCC before 5.0.

Add

... This allows various tools such as a perf probe or gdb debuggers
or systemtap to resolve variable locations using dwarf locations in 
more code.
> 
> Signed-off-by: Mark Wielaard <mark@klomp.org>
> Acked-by: Ian Rogers <irogers@google.com>
> Cc: linux-toolchains@vger.kernel.org
> Cc: Andi Kleen <andi@firstfloor.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: Florian Weimer <fw@deneb.enyo.de>

Reviewed-by: Andi Kleen <ak@linux.intel.com>

-Andi
