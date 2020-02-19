Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3451649A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 17:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgBSQQG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 11:16:06 -0500
Received: from pb-smtp21.pobox.com ([173.228.157.53]:56037 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgBSQQF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 11:16:05 -0500
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 8A923C3D6B;
        Wed, 19 Feb 2020 11:16:02 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=XtMU/4b5IGSfpYkZCGu5uzpv9so=; b=A8qbss
        13zDDHQnllBhRUStKjdBhjG42y4BdLYd3zfE8x1c4GnTnmbAESYHedrpLZFkObOZ
        u9dW0ZWY913qGaVl11sWPaCZkC0sGalwZGpbDBZuD6HtuAdzUAZ1YVoxoE5OdS52
        V8CrxmDNSgRILwM7+x8MSPXE+Rokl9mrToE9E=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 82969C3D6A;
        Wed, 19 Feb 2020 11:16:02 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=Pd52co5mLcPM8CNVJEjnyKKtge8+vEpzfcY4NUuaImw=; b=XjVUwBq4gU1kuQh3xuy1rbq0RW9fP8wTQa5Jwow7zjC6ptzC0o8Ta9cc9VzySvsICTvf6ZRekv6M9gJb24DQ872/8Zk7nognGX/xuQOQLjf6Jk2kB6vQBUBckDHEoAiawi2bvaQkbVB+QJFyMeffogIyDbC6hg2dyx8dH1hrRCY=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 5E1AEC3D67;
        Wed, 19 Feb 2020 11:15:59 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 8007A2DA08DE;
        Wed, 19 Feb 2020 11:15:57 -0500 (EST)
Date:   Wed, 19 Feb 2020 11:15:57 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
In-Reply-To: <20200219074950.23344-1-masahiroy@kernel.org>
Message-ID: <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr>
References: <20200219074950.23344-1-masahiroy@kernel.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 1DA55B42-5333-11EA-A2D4-8D86F504CC47-78420484!pb-smtp21.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 19 Feb 2020, Masahiro Yamada wrote:

> The 'imply' statement may create unmet direct dependency when the
> implied symbol depends on m.
> 
> [Test Code]
> 
>   config FOO
>           tristate "foo"
>           imply BAZ
> 
>   config BAZ
>           tristate "baz"
>           depends on BAR
> 
>   config BAR
>           def_tristate m
> 
>   config MODULES
>           def_bool y
>           option modules
> 
> If you set FOO=y, BAZ is also promoted to y, which results in the
> following .config file:
> 
>   CONFIG_FOO=y
>   CONFIG_BAZ=y
>   CONFIG_BAR=m
>   CONFIG_MODULES=y
> 
> This ignores the dependency "BAZ depends on BAR".
> 
> Unlike 'select', what is worse, Kconfig never shows the
> "WARNING: unmet direct dependencies detected for ..." for this case.
> 
> Because 'imply' should be weaker than 'depends on', Kconfig should
> take the direct dependency into account.
> 
> Describe this case in Documentation/kbuild/kconfig-language.rst for
> clarification.
> 
> Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
> a symbol implied by y is restricted to y or n, excluding m.
> 
> As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> possible value is BAZ=n.

I don't think this is right. The imply keyword provide influence over 
another symbol but it should not impose any restrictions. If BAR=m then 
BAZ should still be allowed to be m or n.

> @@ -174,6 +174,9 @@ applicable everywhere (see syntax).
>  	n		y		n		N/m/y
>  	m		y		m		M/y/n
>  	y		y		y		Y/n
> +	n		m		n		N/m
> +	m		m		m		M/n
> +	y		m		n		N

Here the last line shoule be y m n N/m.

Generally speaking, the code enabled by FOO may rely on functionalities 
provided by BAZ only when BAZ >= FOO. This is accomplished with 
IS_REACHABLE():

	foo_init()
	{
		if (IS_REACHABLE(CONFIG_BAZ))
			baz_register(&foo);
		...
	}

So if FOO=y and BAZ=m then IS_REACHABLE(CONFIG_BAZ) will be false. Maybe 
adding a note to that effect linked to the "y m n N/m" line in the table 
would be a good idea.


Nicolas
