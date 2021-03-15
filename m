Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C5833AF99
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 11:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhCOKHf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 06:07:35 -0400
Received: from codesynthesis.com ([188.40.148.39]:43696 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhCOKHW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 06:07:22 -0400
Received: from brak.codesynthesis.com (unknown [105.186.254.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id EF45B5F1DD;
        Mon, 15 Mar 2021 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1615802839;
        bh=leiXsLjdN8Y+FqZLPyr3PVl00+fnXBtZhhkHD/yZ6lc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=YvtG8X8bvNeV54hLlGBg+t+yqlG68L09LtuhGR4zgXKcXyC5LZRif1nywDoa++WT4
         PSL5c5LXS2AWobaucV40ZwFFliwbW3jBFqZsQRd1ADMm0fpFlg5GYXHZ/sSDpJgsTs
         EzCS3SvRygfAvCDRTroJ7zx7bTwQWikW/wPbr5fac9qSsReFeSwNiGhClC7FrbZeKw
         05xpH8xyYykWEyR+a5OVou+qHaB0jSknO59hBWOpNr3bp657eqMtK0D9EQXJ4Q7rBD
         Od11e+v9fyFHuis8OwcD5YhETky4G84QV6xxjA5ZzcfGVHcI1fkOlLMt4IObrKLCWz
         55Sed/kuIGfYg==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 004C21A802C0; Mon, 15 Mar 2021 12:07:09 +0200 (SAST)
Date:   Mon, 15 Mar 2021 12:07:09 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] kconfig: move conf_set_all_new_symbols() to conf.c
Message-ID: <boris.20210315115747@codesynthesis.com>
References: <20210313194836.372585-1-masahiroy@kernel.org>
 <20210313194836.372585-7-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313194836.372585-7-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> This function is only used in conf.c. Move it there together with the
> randomize_choice_values() helper.
>
> [...]
>
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index f946ab49ef50..d0d5acecb530 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -57,7 +57,6 @@ const char *zconf_curname(void);
>  const char *conf_get_configname(void);
>  void sym_set_change_count(int count);
>  void sym_add_change_count(int count);
> -bool conf_set_all_new_symbols(enum conf_def_mode mode);
>  void set_all_choice_values(struct symbol *csym);

A number of people package kconfig as a library that is then used
in various projects outside of the Linux kernel. Removing this
function breaks the library ABI and potentially such project. For
example, I call conf_set_all_new_symbols() from my libbuild2-kconfig
build system module[1].

I know you don't care much for such out-of-kernel usage, still, this
(and the previous commit) feels like superficial reshuffling of code
and perhaps it's worth not breaking things unless there is something
substantial to gain?

[1] https://github.com/build2/libbuild2-kconfig/blob/master/libbuild2-kconfig/libbuild2/kconfig/init.cxx#L938
