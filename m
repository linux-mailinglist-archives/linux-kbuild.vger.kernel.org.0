Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A017BD309
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 08:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345152AbjJIGHc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 02:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345128AbjJIGHb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 02:07:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE599E
        for <linux-kbuild@vger.kernel.org>; Sun,  8 Oct 2023 23:07:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50336768615so5363318e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Oct 2023 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696831648; x=1697436448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jQSsnNPGoLekEfxryi1OyAWP3eYL96XguQhMUQ9k7M=;
        b=jNZRda37RJ5hX97I0RJ7kHkTsKEjZi8bJsRfTW6pzXd7Ux1rl79pKKEGa77k1XOL58
         KpTsiXm//YmKeS5+m/WX8w3rdgJKp1f7e9iwws315iatF2RUO5vx51SrGQiHQ6L6p/P+
         mXA21cVrLLDyS0ZYVcCP9Ghs+0LA1p0kHpoCBHoH70SgIMDTXowG0mernRddVzXuHhK3
         9sbOqfiA6JwqJ38XS5EJqr0wK7W7t5mnufdw4coRf+aKe0ZSWntYZD3jNbtwq8R9sGyi
         yapV0+whklhVhVoRLDQWqjwiHX1Kan8ubvzAeDQ7YJ6dTKCijc+Z9I1GdwgsSGg97ZbR
         XohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831648; x=1697436448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jQSsnNPGoLekEfxryi1OyAWP3eYL96XguQhMUQ9k7M=;
        b=FYKqJ+TkRZxcSae74QxeA13jAe8qvHkdSRU81GA432dw81lQZAMKVolRoUB4S21myY
         RnOsia7Fx572eehlTl8sytHWQe4pwvlbs21KUR3nDFVrO5j2dUaQCm/SsiK2T0eVp44d
         XmGtBagQ0lnZzeRHjrLeVm9i1HfDe1Vh1OW6OAnkr/8/WSCC0zuheEpjhfZjSjkefqCf
         /fTjw9hD1rJ0gRw9HSfcmCch/QZUKpcMh+2e3Z691oBUhVHR20lsXXE3mjRbu0CT9wmx
         pewYZ4AQxzgu0prVkSEvJzvYv9Wo/GgFu+ey2Fl75OQ0fbVWFwiI9+xHiUDeReqHNvs5
         fUQg==
X-Gm-Message-State: AOJu0YwYgfrAMQ1K8FnHL7CFKnJMIPt4R+LwkAWzJgKG0LbsF2Ch96+4
        6v10WVcGMyjJBBh+hAhowuZcQA==
X-Google-Smtp-Source: AGHT+IEulPl8s4i0M+Zi/sk4AKTnELItj8JoKzhnPWHm3t1wWVYt1qRXTgDtyk/ECIXgf4klmNEzyw==
X-Received: by 2002:a19:5050:0:b0:503:31dc:7d64 with SMTP id z16-20020a195050000000b0050331dc7d64mr12856772lfj.21.1696831645881;
        Sun, 08 Oct 2023 23:07:25 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b00405d9a950a2sm12438473wmh.28.2023.10.08.23.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:07:25 -0700 (PDT)
Message-ID: <19a98e1d-583b-4057-bdbe-895402ab4143@linaro.org>
Date:   Mon, 9 Oct 2023 07:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] mtd: Convert to platform remove callback returning
 void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     David Woodhouse <David.Woodhouse@intel.com>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mtd@lists.infradead.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Joern Engel <joern@lazybastard.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, Yangtao Li <frank.li@vivo.com>,
        Rob Herring <robh@kernel.org>, Li Zetao <lizetao1@huawei.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Hui Tang <tanghui20@huawei.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/8/23 21:01, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/mtd to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields resource leaks and/or use-after-free bugs.
> 
> All drivers touched here returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
