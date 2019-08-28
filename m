Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D1EA06C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 17:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfH1P5B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 11:57:01 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18234 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1P5B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 11:57:01 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x7SFutn8020060;
        Thu, 29 Aug 2019 00:56:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x7SFutn8020060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567007815;
        bh=1zfiZPgyDqL3dFNX7cMApkyvuuIX0Y+mSKUgw2oFgkA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Rgg4PAM6eKih7DlAbzzK41eFR85Yh03qNNGz/pWjAFrDNH0JWQso70PgO45TdBwLT
         0zFw84hFhfbTomB5p7CiOQBZ3WGwNFdGmjAPYo+mdr43nu/MujaFW64tpA7SXuD1Nh
         CMSLA7tiPGRCtqi7pK3JBTniBmWVSF6EbYmcUUAnrr8fi5BW05ieD0eBcLmPlBPIKP
         iBbn5HVVvuI8iaU70u9ENqWNsszRkE7LceauCSjqs7pXtPqYW5i3UB8zr+pgWudjbg
         ggIvdpumI7W9t6tz1/yWV2pzE4yluqZ4/zE6tByq/E/FxGJICAG2PxygUDPuMhSFNl
         4nBNFeFjzYXNA==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id b187so290292vsc.9;
        Wed, 28 Aug 2019 08:56:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVELGYsXE67LAajNWHmd1hUUvpcKtJxai38VVR0fYtkhum7eZPo
        t5TNutSVwP0V57IP4JgU61y4jLkjXk+rN9iYrOY=
X-Google-Smtp-Source: APXvYqz34EYEqF2Ov4AgCxvswtZRN8G1hqm1RtWktexnO9jaNrstBb2UHWinp2Chp4+UeI7obetk4Y/gz+19+Lv40Zk=
X-Received: by 2002:a67:fd97:: with SMTP id k23mr2746020vsq.179.1567007814489;
 Wed, 28 Aug 2019 08:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190827111437.22000-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20190827111437.22000-1-heikki.krogerus@linux.intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 00:56:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoy_Q40zdr7YSkJSV_N8WcMpL8Zunwnf16QTCYUbessg@mail.gmail.com>
Message-ID: <CAK7LNARoy_Q40zdr7YSkJSV_N8WcMpL8Zunwnf16QTCYUbessg@mail.gmail.com>
Subject: Re: [PATCH] modpost: add guid_t type definition
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 8:14 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Since guid_t is the recommended data type for UUIDs in
> kernel (and I guess uuid_le is meant to be ultimately
> replaced with it), it should be made available here as
> well.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/mod/file2alias.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index e17a29ae2e97..c91eba751804 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -34,6 +34,11 @@ typedef Elf64_Addr   kernel_ulong_t;
>  typedef uint32_t       __u32;
>  typedef uint16_t       __u16;
>  typedef unsigned char  __u8;
> +typedef struct {
> +       __u8 b[16];
> +} guid_t;
> +
> +/* backwards compatibility, don't use in new code */
>  typedef struct {
>         __u8 b[16];
>  } uuid_le;
> --
> 2.23.0.rc1
>


-- 
Best Regards
Masahiro Yamada
