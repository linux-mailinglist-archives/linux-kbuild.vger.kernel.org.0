Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD0705CAF
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 03:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbjEQBy7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 May 2023 21:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjEQBy7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2023 21:54:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BFD1701
        for <linux-kbuild@vger.kernel.org>; Tue, 16 May 2023 18:54:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFD8163F21
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 01:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545FCC433EF
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 01:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684288497;
        bh=fHZ5x8EDTb1AItMSGvP1siYTTsPT6WQ1bLg6am5tfn0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IclKtwrKOs1/ARImJIzky8CRQg6AeD7ukgSLKM5+5CdfqSHn350CU6KcyEghBuriL
         jOYMG32F45dkHOlTcRRJ5oNZsH74hY2rDMRvW696KMOFOPpmSSsqIgNr4xa1IMNnKR
         UxnGhh1wrdYcM/F4W5sxTf85J8rabUoUxr3uUB5BP+j4kTw5QqHfVUJDQgvL3G2vaY
         wKIiNyFnpKm8V1BKD6vDfEe2+7yZ9s3hcg64wpzQH8yOzOTsgR2jDdTPwqB6ArsjPx
         IWYPtspENCCGln1e2PGkoEpst+NqtH+LILfJWqQBxFaG9tvOw0whZ3nr2eyvuIC/Pe
         kHeeSUVxwPsBw==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-199ba5154b3so8283804fac.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 May 2023 18:54:57 -0700 (PDT)
X-Gm-Message-State: AC+VfDzfi3YImGVYgwwKoSfMe/Aw7yntwsqM03m4nwgPK/8CgDkBGdeO
        emLP9ikm7ub/jIZC55uPD/buPsTU/ofBBo7KNXQ=
X-Google-Smtp-Source: ACHHUZ5OIJIdjvueNfUiN+zVdQXKu9Hdd/xqbU94cFNA6yxvodrGO2LuR3wHDZPE44bjc8yvMzb4FYNkdnQsqa5oG4k=
X-Received: by 2002:a05:6870:956f:b0:196:452d:e3d8 with SMTP id
 v47-20020a056870956f00b00196452de3d8mr319689oal.3.1684288496594; Tue, 16 May
 2023 18:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <rgbi7vgqel5f2vtzeuxykeh7civd6xxbxkohsgwgsond3vwbbv@hebfs24hxzir> <di7rk2hxyf3uczkl6cqmpttgwi4yuvgh3klsgj5zfkim6zkqha@mosbfoi7ttfv>
In-Reply-To: <di7rk2hxyf3uczkl6cqmpttgwi4yuvgh3klsgj5zfkim6zkqha@mosbfoi7ttfv>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 17 May 2023 10:54:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAScCyN5LO61BwHX-vmrdF+T98vLeNuYx1NaDY36WT0V1A@mail.gmail.com>
Message-ID: <CAK7LNAScCyN5LO61BwHX-vmrdF+T98vLeNuYx1NaDY36WT0V1A@mail.gmail.com>
Subject: Re: Question: Adding new kselftest mod build rule resulting on "m2c:
 command not found"
To:     Marcos Paulo de Souza <mpdesouza@suse.de>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 17, 2023 at 7:21=E2=80=AFAM Marcos Paulo de Souza <mpdesouza@su=
se.de> wrote:
>
> On Mon, Apr 24, 2023 at 02:46:53PM -0300, Marcos Paulo de Souza wrote:
> > Hi,
> >
> > I've being trying to understand a problem when adding a new rule to com=
pile
> > modules on ksefltests:
> >
> > $ make kselftest TARGETS=3Dlivepatch
> > make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/se=
lftests/livepatch'
> > make[3]: Entering directory '/home/mpdesouza/git/linux/tools/testing/se=
lftests/livepatch/test_modules'
> > make -C /home/mpdesouza/git/linux M=3D/home/mpdesouza/git/linux/tools/t=
esting/selftests/livepatch/test_modules modules
> > m2c    -o scripts/Makefile.build -e scripts/Makefile.build scripts/Make=
file.build.mod
> > make[5]: m2c: No such file or directory
> >
> > I managed to create a minimal reproducer for the problem here[1]. I'll =
attach
> > the patches at the end of the email if you want to inspect the changes =
without
> > getting the patches from github.
>
> Humble ping :)



I do not know much about kselftests.
Better to ask this in the kselftest ML.





--=20
Best Regards
Masahiro Yamada
