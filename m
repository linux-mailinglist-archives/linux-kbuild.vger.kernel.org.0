Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E796875C8D1
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jul 2023 16:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjGUOBS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Jul 2023 10:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGUOBQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jul 2023 10:01:16 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DA82736
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2023 07:01:15 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6686ef86110so1313349b3a.2
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2023 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689948075; x=1690552875;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3nW7a3zjat/EJMmViKn547rXn+gKGqkEVZ+ON5g5lA=;
        b=VyqcW4xrSm985LinV705/QAGCGnGCRvh7i2IS7xU2CJZMd5xgyyDDpkBa7QYUIDR07
         bSJMBEqC3hYnfHiTLVI4JIP6FXmO7g/WPOlsKMcdSMFMYrbxk7QeIISBn1JzGev5be7Z
         lLYjbm7EBxXYqQ+XjQLt879xI/JLTWOeTKzIq39W4tDfQMWdNoJIzFrbGbzuzRsrtTFf
         rW5eRzgh+27KmjERDC4M0FrBEzSqWZ47hOyf85UtMCIn9RlrbY4acaMkXKLsd3Wo/Li/
         IcGa+nadecvMYzsrowwTwYoRG2asJO266NAPaIwrrPDA/KQGV1UDsA0hU5YRmV+HoISb
         hlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948075; x=1690552875;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3nW7a3zjat/EJMmViKn547rXn+gKGqkEVZ+ON5g5lA=;
        b=L5Mes+oO4i2bPaB6IlqgdEMibcb3DzUegd0RFFfTWPI7M62A3JZVAVKhFz1ATvBgZ0
         irBwU6OxsQqTJ430L7/b/Nyy9Rg7N7YSX7sm4OHzlYZQDEDYPSyzfY3kGovLfLUZawP/
         2ywmVifDXtBDyOTHHYQOkk8SrS00s5zAkXkHq2hKiOKZ2wQ3QLG5Nj/AmeVfVuWBXTpj
         wCVsRVslHWC1N5bvuztNPRoOWhjgHwDbtEIYyhYEF9fjHTGJoKxf2iv9cUsMIxGRzwzZ
         d3mHLrB7G8bKxbJW9j47VfbfExRI3pRsl5mT33DeLt3ZHhW1iK8ROajEiQGBQjvcPKoc
         0idw==
X-Gm-Message-State: ABy/qLY4dY1+YuX8Srt5XoS1PSYKqezrx4Xzk3EUGqasC8jhWN1A7byb
        MbIiu4JtlfMVi74eRB4gbcUP2w==
X-Google-Smtp-Source: APBJJlG0fUIYZkN2JoUkRkwVB/0QP943GdxGKHbR1N0g7KeSS+C3gRFyCGams25Xb1vP6DXxFTJofg==
X-Received: by 2002:a05:6a20:9389:b0:131:1943:c858 with SMTP id x9-20020a056a20938900b001311943c858mr1830323pzh.14.1689948074713;
        Fri, 21 Jul 2023 07:01:14 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902b70600b001b016313b1dsm3502101pls.86.2023.07.21.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:01:14 -0700 (PDT)
Date:   Fri, 21 Jul 2023 07:01:14 -0700 (PDT)
X-Google-Original-Date: Fri, 21 Jul 2023 07:01:12 PDT (-0700)
Subject:     Re: [PATCH -next] modpost: move some defines to the file head
In-Reply-To: <CAK7LNASc9vXvHiDRarbKXq-m-9r0wso2VydBFMfd4sCt0mA_8w@mail.gmail.com>
CC:     wangkefeng.wang@huawei.com, mcgrof@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, nicolas@fjasle.eu,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     masahiroy@kernel.org
Message-ID: <mhng-e12b1787-9deb-487c-a595-2fb4c3f91178@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 21 Jul 2023 04:58:20 PDT (-0700), masahiroy@kernel.org wrote:
> On Thu, Jul 13, 2023 at 1:28 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> On Wed, 12 Jul 2023 08:55:23 PDT (-0700), masahiroy@kernel.org wrote:
>> > +To: Luis Chamberlain, the commiter of the breakage
>> >
>> >
>> >
>> > On Wed, Jul 12, 2023 at 10:44 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> >>
>> >> with "module: Ignore RISC-V mapping symbols too", build error occurs,
>> >>
>> >> scripts/mod/modpost.c: In function ‘is_valid_name’:
>> >> scripts/mod/modpost.c:1055:57: error: ‘EM_RISCV’ undeclared (first use in this function)
>> >>   return !is_mapping_symbol(name, elf->hdr->e_machine == EM_RISCV);
>> >>
>> >> Fix it by moving the EM_RISCV to the file head, also some other
>> >> defines in case of similar problem in the future.
>> >
>> >
>> >
>> > BTW, why is the flag 'is_riscv' needed?
>> >
>> >
>> > All symbols starting with '$' look special to me.
>> >
>> >
>> >
>> > Why not like this?
>> >
>> >
>> >        if (str[0] == '$')
>> >                  return true;
>> >
>> >        return false;
>>
>> There's a bit of commentary in the v1
>> <https://lore.kernel.org/all/20230707054007.32591-1-palmer@rivosinc.com/>,
>> but essentially it's not necessary.  I just wanted to play things safe
>> and avoid changing the mapping symbol detection elsewhere in order to
>> deal with RISC-V.
>>
>> IIRC we decided $ was special in RISC-V because there were some other
>> ports that behaved that way, but it wasn't universal.  If folks are OK
>> treating $-prefixed symbols as special everywhere that's fine with me, I
>> just wasn't sure what the right answer was.
>>
>> There's also some similar arch-specific-ness with the labels and such in
>> here.
>
> Hi Palmer,
>
> I am not a toolchain expert, but my gut feeling is
> that the code was safer than needed.
>
>
> I'd like to remove the 'is_riscv' switch rather than
> applying this patch.
>
> Will you send a patch, or do you want me to do so?

I've pretty much got it already.  Do you want it on top of the original 
patch, or just squashed in so you can drop it?
