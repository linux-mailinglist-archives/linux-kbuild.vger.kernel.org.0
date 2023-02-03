Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45DF68A385
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Feb 2023 21:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbjBCU1u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Feb 2023 15:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjBCU1t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Feb 2023 15:27:49 -0500
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch [185.70.40.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814E379609
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Feb 2023 12:27:48 -0800 (PST)
Date:   Fri, 03 Feb 2023 20:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1675456066; x=1675715266;
        bh=opEar5EVUY4AvP/norysGG3YKjV3oD8HO1BnL04bt0c=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=LD754sQb6KM/E43PaCbpnXQ82cMEhB4mYvaQN9BPR8tA9CJjBLBimPBn7Cc/lsfIt
         yeAgzLKDQ/FU43kd2mDRhaCqm4qsH4CCBnhks7F/skGVnnVQVhQmGMbGCdJSMsuCUZ
         qPoju+XoPyyxt+YoHi9v0PoZAnkvnAAxWlbH4J6Job9qAxlJL0YivIpBvP7s8NufoM
         CmlyPdq75QpUe6qjRjmhUuZJRzMd20oD+JTdL3JUWXvYYzumoPDbpp4frBib/i37Fe
         BI3lPsnOFXfPCYicSskzD0N1fLarycDhqAvgK+RceL2ABe4A92gO5LrYmpIzGLOJCQ
         tEw5cG3188A8A==
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
Message-ID: <W5b0EO2rD9JcES6f6x8mPl_DkA5Fk_SxDDjatibRtCNkdVcdqj5opyCLNKM8meDL2asPXaKrkP02W9gLx45WN8zlwQ9cEJwbq1GYJSUVsUY=@protonmail.com>
In-Reply-To: <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
References: <20230203173704.108942-1-mcanal@igalia.com> <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday, February 3rd, 2023 at 21:08, Miguel Ojeda <miguel.ojeda.sandonis=
@gmail.com> wrote:


> On Fri, Feb 3, 2023 at 6:37 PM Ma=C3=ADra Canal mcanal@igalia.com wrote:
>=20
> > rust-project.json is the configuration file used by rust-analyzer.
> > As it is a configuration file and it is not needed to build external
> > modules, it should be delete by make clean. So, delete rust-project.jso=
n
> > when running make clean.
> >=20
> > Link: https://github.com/Rust-for-Linux/linux/issues/939
>=20
>=20
> Thanks Ma=C3=ADra! I will add a tag with Bj=C3=B6rn as a `Suggested-by`, =
if he
> is OK with that.
>=20
> Cheers,
> Miguel

Sure
