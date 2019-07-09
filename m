Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748C063A3A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 19:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIRhy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 13:37:54 -0400
Received: from pb-smtp1.pobox.com ([64.147.108.70]:60058 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIRhy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 13:37:54 -0400
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id C754C161342;
        Tue,  9 Jul 2019 13:37:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=ZPzL96906deSPszntNDHK2QFX3M=; b=gufTxB
        zNSe+0divwYcBXwLhl9W3sFW7BjvHwmRzFddQ05k36d7tv2a25UjIIOxanJXoOtD
        ynWmKEeObbiHF4Wvmzj5VKMD2JqVBTuU5B/1bWCi1zttldwtRQOxwxGPf3VwFHae
        ZTVdmAa/irDQ+ccsim1Jzz0QckHhqwsrggLFU=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id BE41C161341;
        Tue,  9 Jul 2019 13:37:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=JUWCum9pcbTPQLn3Li5UWdFaYelziHmHH3PL7HgMqUA=; b=xks7+qKO5WD+kKbJjFOF8VQyA5IpsnEK4OFwGE8D3PZDdxs5jke6gTQYNTNVpTuw+9lZxor+rnj4Og4V3l/KkAFJFxOEdbqgqYP59TtxNtwcnTTVeAbnmcjK6S4EqKV6l5owBWQteKjscyC6KqLyM/GwiQFONIgs423mD66FaEE=
Received: from yoda.home (unknown [70.82.130.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 43457161340;
        Tue,  9 Jul 2019 13:37:51 -0400 (EDT)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 5E86E2DA0192;
        Tue,  9 Jul 2019 13:37:50 -0400 (EDT)
Date:   Tue, 9 Jul 2019 13:37:50 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 08/11] kbuild: create *.mod with full directory path and
 remove MODVERDIR
In-Reply-To: <20190709042416.27554-9-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1907091332150.4190@knanqh.ubzr>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com> <20190709042416.27554-9-yamada.masahiro@socionext.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 466A70CC-A270-11E9-96DF-46F8B7964D18-78420484!pb-smtp1.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 9 Jul 2019, Masahiro Yamada wrote:

> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -47,13 +47,10 @@ cat > "$new_ksyms_file" << EOT
>   */
>  
>  EOT
> -[ "$(ls -A "$MODVERDIR")" ] &&
> -for mod in "$MODVERDIR"/*.mod; do
> -	sed -n -e '3{s/ /\n/g;/^$/!p;}' "$mod"
> -done | sort -u |
> -while read sym; do
> -	echo "#define __KSYM_${sym} 1"
> -done >> "$new_ksyms_file"
> +sed 's/ko$/mod/' modules.order |
> +xargs -r -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' |
> +sort -u |
> +sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"

Did you consider the case when CONFIG_MODULES=y but no modules are 
selected? Also -r to xargs is a GNU extension and there were some 
efforts to remove theur use in the past (no idea if this is still a 
concern).

Other than that, looks good to me.

Acked-by: Nicolas Pitre <nico@fluxnic.net>


Nicolas
