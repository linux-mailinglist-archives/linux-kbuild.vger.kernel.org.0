Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22677E52BC
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 10:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbjKHJkE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Wed, 8 Nov 2023 04:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHJkD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2023 04:40:03 -0500
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F8841B3
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Nov 2023 01:40:00 -0800 (PST)
Received: from loongson.cn (unknown [209.85.128.172])
        by gateway (Coremail) with SMTP id _____8DxqOpuV0tl8v83AA--.8715S3;
        Wed, 08 Nov 2023 17:39:59 +0800 (CST)
Received: from mail-yw1-f172.google.com (unknown [209.85.128.172])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfS9sV0tlFPE7AA--.81S3;
        Wed, 08 Nov 2023 17:39:58 +0800 (CST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a8ee23f043so78425457b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Nov 2023 01:39:58 -0800 (PST)
X-Gm-Message-State: AOJu0Yy4XDVICHUIen0hlx+m4elph5JcM+DyKv2FzTElSC/td79vrFcv
        s7dilz/Lwn27bOP66h63x4qEMDI2rFGIvBHcXE7fpQ==
X-Google-Smtp-Source: AGHT+IGJw6kxe2AuHux+s5+MaURvgqvxjUxou2MX4C7yq7jPaCu5YsXeP43aDJUBTZfW4qAw+LoksQL8ZcDMCnjIKY0=
X-Received: by 2002:a25:ad48:0:b0:d9a:6b1e:ef51 with SMTP id
 l8-20020a25ad48000000b00d9a6b1eef51mr1139641ybe.2.1699436396146; Wed, 08 Nov
 2023 01:39:56 -0800 (PST)
MIME-Version: 1.0
References: <20231108040447.288870-1-wangrui@loongson.cn> <d32d8a26dcd75a840727cdb50546b621d34d326b.camel@xry111.site>
 <CAHirt9jQHTRGdv4rShgvWHEbG1vzuLkNDbxLP7x4eMtuB3BB5g@mail.gmail.com>
 <4075b4dad9bedbc3def5dfe75f66f3e5d49ce6d5.camel@xry111.site> <CAHirt9jRH1CKE=BUWpML_jNgTBvMfJiYoAYPnVS3E=89oBUVyw@mail.gmail.com>
In-Reply-To: <CAHirt9jRH1CKE=BUWpML_jNgTBvMfJiYoAYPnVS3E=89oBUVyw@mail.gmail.com>
From:   WANG Rui <wangrui@loongson.cn>
Date:   Wed, 8 Nov 2023 17:39:45 +0800
X-Gmail-Original-Message-ID: <CAHirt9i-esjhZWF9yTsd+wBuMB+ebjVT33dY5VUkWHLcYREQpw@mail.gmail.com>
Message-ID: <CAHirt9i-esjhZWF9yTsd+wBuMB+ebjVT33dY5VUkWHLcYREQpw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Disable module from accessing external data directly
To:     Xi Ruoyao <xry111@xry111.site>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-CM-TRANSID: AQAAf8DxfS9sV0tlFPE7AA--.81S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww4kArykCFW3Gw1fKF1Utwc_yoW8WrWrpF
        ZrGF1rKrs7Jr1jqrn2vFn7X3WYva1xArWxGFy0vw1Yvas0kr9rXa13tr4agF9FqryDWw12
        9r4vga42934UX3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
        xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
        AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
        JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
        8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r4a
        6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IU8OyCJUUUUU==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 8, 2023 at 5:36 PM WANG Rui <wangrui@loongson.cn> wrote:
>
> On Wed, Nov 8, 2023 at 5:26 PM Xi Ruoyao <xry111@xry111.site> wrote:
> >
> > On Wed, 2023-11-08 at 17:20 +0800, WANG Rui wrote:
> > > > then the linked binary triggers a SIGBUS.  Ideally this should be
> > > > detected by the linker at link time, but currently the BFD linker
> > > > fails
> > > > to detect this error (FWIW this flaw is caused by a really nasty
> > > > method
> > > > for the medium code model implementation).  So to me -fno-direct-
> > > > access-
> > > > external-data is the default.  I also grepped for -fdirect-access-
> > > > external-data in the kernel building system but I've not found any
> > > > match.
> > > >
> > > > Are you using a different version of Clang, or maybe Clang has some
> > > > configuration-time option to make -fdirect-access-external-data the
> > > > default?
> > >
> > > The clang enables `direct-access-external-data` by default in PIC and
> > > disables it by default in no-PIC. This also applies to PIE. [1]
> >
> > Oh sh*t:
> >
> > xry111@nanmen2 ~ $ clang t1.c -O2 -fno-pie -no-pie
> > xry111@nanmen2 ~ $ ./a.out
> > Bus error (core dumped)
> >
> > I'll consider it a Clang bug then.
>
> That's it, no copy relocations. As far as I know, copying relocations
> has some issues and is not recommended by Fangrui.
>
> For modules, if distance is not a problem, `no-pic` and
> `direct-access-external-data` can be together because the code is
> writable. Does it seem reasonable to exist?

Of course, for LoongArch, it is better for `no-pic` to disable
`direct-access-external-data` by default. I will send a patch.

-- 
WANG Rui

