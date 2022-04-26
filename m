Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179B4510541
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Apr 2022 19:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbiDZRYY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 13:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346947AbiDZRYU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 13:24:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C607D3BA4F
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 10:21:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w19so33122097lfu.11
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vY6n+jio0gwvbbRftwZVfFCV+8S6O4vtPz4jG39i3+s=;
        b=TWgNkRLLNcjl/XaddvkQE1EterU2lrL5fehRf6oIDjTGVr97VNKpW0uo3KsGV3D18N
         HnGn/22GaBBZj3uDR7VLh6dk9maG7nV1HxvquyIXqhfXVAORSOyRhrOBwOGWlmWqx7CZ
         YAFBhI4mT+hhYOcbEIg8podME13jpUF1xd9+2iORyI3MPGLFURtymQEiszOrhzRqq78/
         8w5RIseWywi/QHWQT+CI9z9PF6SWES4MpGMWFqI0Qy4ROgyjRyxKWQwEwZiJeWJ2qaUt
         3RLVAStRE/oiOk0nisyZFuUCyXiZiiT46Oy94aqcE60akyN6oADQpk5NlS03rRBYzayI
         kowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vY6n+jio0gwvbbRftwZVfFCV+8S6O4vtPz4jG39i3+s=;
        b=sVkRISM+PHm6Nb3GwiRfDR5Kh9CCLNDDUf0Cn806u4CwphiLiI6cDymmswm9AYB5Oc
         lUNQW0i7L807TzGipcRQMxgbOzMH15F6FqTUJ4wIxAQCiNPKO6HriP0o1c9aPc45IZkz
         9f8wUNNHRR+zGc0+NQQ/GVFX5BW4+RMpWxyau7hhfIPLZZGvIHNiJh9I0FezEGR6HzWe
         wWr5RhS5sUAHvf833+H/i4OatCDdG+xcs533SQgpQsSaXtCIlM6NvOYUErjzOyDhrbGX
         oz3u1pJQ1T9mqCifUKORtbxOLGmeKIX1AIcKUZI2rHzcn/GYwzX8ahnwsdNQn+LCPfn1
         QvuA==
X-Gm-Message-State: AOAM532gN61HoNswmkXlRBfzvEEbFPSPj0v/e5s7oOUOtU/XZWhDIWG6
        N6uwz5xNbRfGyXxF9U9cNPsX9hkvQKyxGUPdlaeCrw==
X-Google-Smtp-Source: ABdhPJyhWp+J5ybWMVXvAk8ooMs7uPcSI9Sm8SIIWGzIh31BZvVfqbRuznmM+sw9qijUdRJPxFo3eCsyVhjuM8uWQu0=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr17402224lfl.87.1650993669901; Tue, 26
 Apr 2022 10:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-14-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-14-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 10:20:58 -0700
Message-ID: <CAKwvOd=SsRq8YJ7V6XQmFLhOYvvFk0B+Rfftpc_=uEEUfSq6ug@mail.gmail.com>
Subject: Re: [PATCH 13/27] modpost: traverse the namespace_list in order
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Use the doubly linked list to traverse the list in the added order.
> This makes the code more consistent.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
