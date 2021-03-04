Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F3632DCB7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 23:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241291AbhCDWLI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 17:11:08 -0500
Received: from pb-smtp2.pobox.com ([64.147.108.71]:59301 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240691AbhCDWKr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 17:10:47 -0500
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 0ABBE97DCD;
        Thu,  4 Mar 2021 17:10:06 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=cWl3vaUcn8eCVnVHDPCAenNYgfs=; b=pogIiU
        LdV3qAMuofiPnmpjUzPC5xIQzEXjz4NC6rddNecOuXIIU/phxgDFWK3TNrMfJsFg
        K3w/46R7zmkvs/y1jL5QfbAIQ6lJh5NJyqsLxxvwcUdnx3Z7iRdlyM1JUgeTZ4kQ
        2ABJ8WLEn9UdOaO4IsyJcrmX+s/CcYtfi+un4=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id C888197DCA;
        Thu,  4 Mar 2021 17:10:05 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=FHu7CSiHhDUgzsaZzuH8y0LAX0JIO4pxhbnmV+gQoAw=; b=DU6XQrt+qYHE7ZDfoEJ+IYwa3fCKBR95gy/C7dU7UnoNX8AP4iFFbNS/GAFw2XP5L/6qQpeZtXylegFJdwiMe06NdNvSU7enEDdTLCqdzNJFGnLdciR1LA840PTVYgZXdSPKIqN3IKnn744lgKZlFtqIVz7gJ2/d36fjJEHoDes=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 6A9B297DC5;
        Thu,  4 Mar 2021 17:10:04 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 87BF22DA015E;
        Thu,  4 Mar 2021 17:10:02 -0500 (EST)
Date:   Thu, 4 Mar 2021 17:10:02 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] kbuild: collect minimum tool versions into
 scripts/tool-version.sh
In-Reply-To: <20210303183333.46543-2-masahiroy@kernel.org>
Message-ID: <798s9r5n-5nr8-1p1s-837-s07p72q72031@syhkavp.arg>
References: <20210303183333.46543-1-masahiroy@kernel.org> <20210303183333.46543-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 5F66614C-7D36-11EB-8D3A-74DE23BA3BAF-78420484!pb-smtp2.pobox.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 4 Mar 2021, Masahiro Yamada wrote:

> The kernel build uses various tools, many of which are provided by the
> same software suite, for example, LLVM and Binutils.
> 
> When we raise the minimal version of Clang/LLVM, we need to update
> clang_min_version in scripts/cc-version.sh and also lld_min_version in
> scripts/ld-version.sh.
> 
> In fact, Kbuild can handle CC=clang and LD=ld.lld independently, and we
> could manage their minimal version separately, but it does not make
> much sense.
> 
> Make scripts/tool-version.sh a central place of minimum tool versions
> so that we do not need to touch multiple files.

It would be better and self-explanatory if a script that provides the 
minimum version of a tool was actually called ... min_tool-version.sh or 
the like. Otherwise one might think it would give e.g. the current 
version of installed tools.


Nicolas
