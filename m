Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D8671476A
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 May 2023 11:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjE2JsE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 May 2023 05:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjE2JsD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 May 2023 05:48:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78DBDE
        for <linux-kbuild@vger.kernel.org>; Mon, 29 May 2023 02:47:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 840DD61324
        for <linux-kbuild@vger.kernel.org>; Mon, 29 May 2023 09:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E416EC433EF
        for <linux-kbuild@vger.kernel.org>; Mon, 29 May 2023 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685353666;
        bh=oOE3IfjssP+wDqjQtLdabaSdFCCLBjqfBA1fYI4ONsE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=anPvxoTciToB4T3GGFjC8ehbLLr8HFjrW02ESsiXvr4LOv71nYkDxr8MaDc0V+8UU
         /NtSj9iEvNh0tURJJdWY1S7/PFG1jbPOZcew3dajvJUu9Hq7Auxbc8LwiAfwJq8C3u
         gkLBcuK2PqD+Fc42ck3VqjkE3foybibTpqhXFjJA/77Vmk4vJ1y00KoZDFB6jOvm2S
         kvceo7vtNnH/KYZCoQjEIBCNpHlQy2/I/YouiRMbU0nLWEKDKmqTU944EzadJDZRbT
         X/AIT2AFhTKSbjFr5ML61REa8Wr+b/ioQTFFQXC3eeLWSI1cel3XhEqdrVI5QLsTja
         kKPKRUgHXvMBw==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-557de45f56aso1626926eaf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 May 2023 02:47:46 -0700 (PDT)
X-Gm-Message-State: AC+VfDwRj9hS4ZJA2QM/IFmEfP1imB+qv4UJ6XkJPzoHHbIc2W9Hl9KQ
        IXXBpov98mnmXrT24eOT/SVS2a/2BPGxVZX4KtM=
X-Google-Smtp-Source: ACHHUZ6n8cY6xTr99Oa8TeUreEZni4i5Y0RJTJbDeYQHZpSYpoz6/htf8SXmC92zg4lUq0S1vk2DRht0VVtoxkFIqPY=
X-Received: by 2002:a4a:142:0:b0:546:ecb3:f42 with SMTP id 63-20020a4a0142000000b00546ecb30f42mr2796553oor.8.1685353666213;
 Mon, 29 May 2023 02:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <44BBBA3C987593479C2971697BF184F20AE8F78DA610@mail.lab.act.buaa.edu.cn>
In-Reply-To: <44BBBA3C987593479C2971697BF184F20AE8F78DA610@mail.lab.act.buaa.edu.cn>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 29 May 2023 18:47:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASx0ooZa75O1N5z5rm_rjakiRk6Cd1=rCao9oEG3MH9dg@mail.gmail.com>
Message-ID: <CAK7LNASx0ooZa75O1N5z5rm_rjakiRk6Cd1=rCao9oEG3MH9dg@mail.gmail.com>
Subject: Re: A question about the handling of invisible symbols in menuconfig
To:     "GUO, Siyuan" <guosy@act.buaa.edu.cn>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 28, 2023 at 10:50=E2=80=AFPM GUO, Siyuan <guosy@act.buaa.edu.cn=
> wrote:
>
> Hi
>
> I found that Kconfig handles invisible symbols differently.
>
> For example, in oldconfig program, when a configuration item is invisible=
, it will force the assignment of newval,
> but in the menuconfig program=E2=80=99s load config, it will not handle i=
t.
>
> Why is this?


I do not understand what you mean.

Can you provide the steps to see
the difference between them?


--=20
Best Regards
Masahiro Yamada
