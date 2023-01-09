Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7045666273E
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 14:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbjAINgo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 08:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236646AbjAINgH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 08:36:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0BC3AB36
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 05:34:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49047B80DDA
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 13:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DA1C433F0
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673271240;
        bh=QlqKkGcmLNSZcIkq37gSTwqCS8xM10fwzOcqJA9PlW8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PcGPGbkVPHZqD3BLsevPFhJAv1eHaYE56iqiS9DwjbzIxQAk169Ly5mSb0qoD4did
         6mjRYjjdJcoRabP8fZgQGlcpvY4MxjEA3Vx/RAJGE+CEDseJ9gi7Vs0yTBA4Vs3KIW
         3IT6vtDghJG+3f+3cxaqNIij31s4zpDBpYsOE/gxvrkq0Wa5yQJbdFSZkoF8BQ/WD7
         KWGgEYvZ17u0B8ljcsurA09cQo8Y6aZfVU9rFLfxVEGqO7PnR4JUwgJDM/HVriLpZR
         DpsyzZq70nohniFTLUgjrzsCs8m1297KxQK+6NNY66ICMy5tUtIRL9cPGxMwzqON4I
         N+4pCeRz5MA2Q==
Received: by mail-oi1-f178.google.com with SMTP id e205so7064782oif.11
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 05:34:00 -0800 (PST)
X-Gm-Message-State: AFqh2krAsRkxRN7ZQ+7ZHGp0sevWxx4Z5aVd0mU8O7qeMWvjH8+hTgO+
        tMwuTyvQ8zIqmAVEOqDulKjw5zeSRQaJ6YR21XM=
X-Google-Smtp-Source: AMrXdXsWDw1rEnZS4fSdHGEzyArm8cf8l4+o04SUDDi5w8mBU8Wf/G5M0YHuqiqWHNF1m/3kG6ngXoR74KOVAKwC1TU=
X-Received: by 2002:aca:3755:0:b0:35e:7c55:b015 with SMTP id
 e82-20020aca3755000000b0035e7c55b015mr4119723oia.287.1673271240210; Mon, 09
 Jan 2023 05:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20230109082514.50747-1-arend.vanspriel@broadcom.com>
 <CAK7LNAQg6fvHmxRh_GCsV798gC_PY4JGVChLwKzS6V9sRCH0gA@mail.gmail.com> <5076c5d5-f00f-9a9f-beb3-79f40f3a88fa@broadcom.com>
In-Reply-To: <5076c5d5-f00f-9a9f-beb3-79f40f3a88fa@broadcom.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 9 Jan 2023 22:33:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpeq6UY8qQBJ43rh6R1LuE7EtV7TDAyxXFjTHWnr=Yog@mail.gmail.com>
Message-ID: <CAK7LNAQpeq6UY8qQBJ43rh6R1LuE7EtV7TDAyxXFjTHWnr=Yog@mail.gmail.com>
Subject: Re: [PATCH] scripts: rpm: make clear that mkspec script contains 4.13 feature
To:     Arend van Spriel <arend.vanspriel@broadcom.com>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 9, 2023 at 9:42 PM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> n 1/9/2023 11:21 AM, Masahiro Yamada wrote:
> > Hi.
> > Thanks for catching this.
> >
> >
> > On Mon, Jan 9, 2023 at 5:25 PM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> A fix was made in the mkspec script [1] that uses a feature, ie. the
> >> OR expression, which requires RPM 4.13. However, the script indicates
> >> another minimum version. Lower versions may have success by using
> >> the --no-deps option as suggested,
> >
> >
> > As far as I tested, CentOS 7 did not work with --no-deps solution.
> > It just ended up with a syntax error.
> >
> >
> >
> >
> >
> >> but feels like bumping the version
> >> to 4.13 is reasonable as it put me on the wrong track at first with
> >> RPM 4.11 on my Centos7 machine.
> >>
> >> [1] https://lore.kernel.org/linux-kbuild/20221228191014.659746-1-masahiroy@kernel.org/
> >
> >
> > This is already merged.
> >
> > Please use
> >
> > Commit 02a893bc9975 ("kbuild: rpm-pkg: add libelf-devel as alternative
> > for BuildRequires")
> >
> > instead of the URL.
>
> So do you want me to resend the patch?
>
> Regards,
> Arend


Yes, please resend the patch with updated description.


-- 
Best Regards
Masahiro Yamada
