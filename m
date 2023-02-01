Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA14686B28
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Feb 2023 17:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjBAQJM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Feb 2023 11:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbjBAQJK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Feb 2023 11:09:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF8665F3D;
        Wed,  1 Feb 2023 08:09:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB2FE6185D;
        Wed,  1 Feb 2023 16:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0F7C4339C;
        Wed,  1 Feb 2023 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675267748;
        bh=XlTVcl6pSuwGK4BJi/TGl8JIKNOkBakY8ZAvcV73wwo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MnTMlZQUUwZ0uDI6wpIxk2EvEovOGQh7yNpQ4c8MaHEW4N9WuZRR4YaV7u7EuTTvk
         QnrILWmH+pNtRvSUxI/Bpy18MkEaOg5ESxcEu/6RaIm+6EmMC4Vtn7xIfJEFO76QCb
         FeMz23fFWtMtyvBiequvCBsT46Lg9jQfDY3pnnM1zTbz2wJk89UM49PkE2kVw5nB48
         qsTgMfLmqs0OFas7wO6USY/LG4OAh7vJRHCHP3FT4N2eKDNtK83kZKHL4y4EXxpPyI
         GH/Z0a93vncyeCc0ymNBklWMwVFWcZaQAAoU92N5oBAHuRoAVuZmVdLsQCDFfNvZI1
         RygWibEl/unVA==
Received: by mail-oi1-f177.google.com with SMTP id bx13so10322576oib.13;
        Wed, 01 Feb 2023 08:09:08 -0800 (PST)
X-Gm-Message-State: AO0yUKW8EJG6GPrmVEzG0EHFUa8WCcBnGyEe9+qxVuLdUvb6VxIa5CTf
        9xIoY9pacuRsobhxWYML+aJN0YTM6uThqbwBcDM=
X-Google-Smtp-Source: AK7set/DRBtSMjKZndtV3Y3qnJoJTmJv3u24jmR6GT5uxkXiZPdtdjoUCTo7Bi5hIZuLf9CLWXdmHQ7p7t3USezwG/w=
X-Received: by 2002:a05:6808:17a6:b0:35e:7c55:b015 with SMTP id
 bg38-20020a05680817a600b0035e7c55b015mr221316oib.287.1675267747595; Wed, 01
 Feb 2023 08:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
 <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
 <CAA8EJpotkSfP6xgm9s-8iS3FGsTss403RXcBuMwB_9=JFdispA@mail.gmail.com> <74c27e78-8fb7-9c87-57ef-babd6741b631@kontron.de>
In-Reply-To: <74c27e78-8fb7-9c87-57ef-babd6741b631@kontron.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 2 Feb 2023 01:08:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQHXMb5t7sxyudiueb=ToR8OVif20a0KvyZ6XB1vLJhg@mail.gmail.com>
Message-ID: <CAK7LNARQHXMb5t7sxyudiueb=ToR8OVif20a0KvyZ6XB1vLJhg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow validating individual dtb files against schema
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 2, 2023 at 12:51 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Masahiro,
>
> On 25.10.22 21:07, Dmitry Baryshkov wrote:
> > On Sat, 16 Jul 2022 at 12:38, Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> First, apply the following clean-up patch to reduce the code duplication.
> >> https://lore.kernel.org/all/20220716093122.137494-1-masahiroy@kernel.org/T/#u
> >>
> >
> > The cleanup patch has been merged into 6.0.
> >
> >> Then, apply the attached patch.diff
> >
> > But the patch you proposed didn't seem to be posted. Do you still
> > intend to post it?
>
> Can you formally post the patch you proposed above?
> It is very useful and works just fine for me.
>
> Thanks
> Frieder



Rob applied an equivalent patch
(with help message added).



commit ec201955a53be4b57a467f7160724ff06289cead
Author: Rob Herring <robh@kernel.org>
Date:   Mon Dec 19 19:32:33 2022 -0600

    kbuild: Optionally enable schema checks for %.dtb targets





--
Best Regards
Masahiro Yamada
