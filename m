Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DF5698F7F
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Feb 2023 10:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjBPJQq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Feb 2023 04:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBPJQp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Feb 2023 04:16:45 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4013B1C7E7
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Feb 2023 01:16:44 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id my5so3563370ejc.7
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Feb 2023 01:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9FNglQcCxQyOSfgnClzbl2z0FIefkJaddL/GbB5I2c=;
        b=apzS31Voo3MgYzPmwbJiZkFUGxtflTAPDcXAbwJ0mp1CtQbZZJ2H1e80+rf4Z9ysnM
         pDh5Ycv7nwP+Bqxbk4TSRr8/yiylu8DH8Dvie0/+AoGuEj+AzfjWLvTYCHUSiDaFANBu
         PtiXZ3iKKrAaxqLSyuZdrzqBhBHmORz6Mba6N0i6FM+BR5Sz5CT6GiYh8o7HQ9wPn7vd
         qYQqUr+q+cPsgA1CgVogBJwRyG9JvuE2z0rwVqzQhnY/Krr2x1yoZt0Wpc7bxL6rYoNH
         xWMG/QLtj5e7nzdufjcSgEehgPyAnN7yDnC20VsumJw/j4zcF+fSbelE3VCqJdm13Hx7
         7b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9FNglQcCxQyOSfgnClzbl2z0FIefkJaddL/GbB5I2c=;
        b=rHGfbNE+PAEth+YFJ0vjj9P9tDX9xkK9Vk8kBmfReSTlh7gPt+0y012hT4t6a/xDTL
         NVNmkKZdNPIeQdtnkPbgYcLEips/WVM8OLpgxJowEDwsPnsbT93A9OeEfKqw7vDqZHbK
         XWkh5QLkW4guPwmJQv7baqHfLZ4J7xISdM6h8vpePqS2Y3mGD8JFlyTRO++62L8pJqN0
         NHVUdTuk+Wy653+BHL5KwX4dRbpMA5VoRHswqTKKgI4qKu5BIMybcyQCRCqHiktX7v9E
         aWCxYIPi+VeR9KXbEuWxkNJbJDZtQDCdVvuYVwJdiDtd3e0xGNRxlt/lvOGR08+h+T0a
         js9Q==
X-Gm-Message-State: AO0yUKUPuB/HBGGg1GKLUL0XIINWBSANb73CKLHZ43N/n5zL0P+24GjL
        s4a2R886uEHWxUJvZ1fUj1UH8Q==
X-Google-Smtp-Source: AK7set+kDJLUJSKzlsLyJSrK6+rqxZAGJG3YyEt+vkobl86x6eiiVQc1B5fHb46oVN3xWoQIa18+Qg==
X-Received: by 2002:a17:906:38f:b0:87b:e105:5d9a with SMTP id b15-20020a170906038f00b0087be1055d9amr5228518eja.67.1676539002792;
        Thu, 16 Feb 2023 01:16:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e26-20020a50a69a000000b00499703df898sm531436edc.69.2023.02.16.01.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:16:42 -0800 (PST)
Message-ID: <fb380316-c8c5-104b-3054-a504f0fed6c0@linaro.org>
Date:   Thu, 16 Feb 2023 10:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 0/7] add support for CDX bus
Content-Language: en-US
To:     "Agarwal, Nikhil" <nikhil.agarwal@amd.com>,
        "Gupta, Nipun" <Nipun.Gupta@amd.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "eric.auger@redhat.com" <eric.auger@redhat.com>,
        "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>,
        "song.bao.hua@hisilicon.com" <song.bao.hua@hisilicon.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "maz@kernel.org" <maz@kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "jeffrey.l.hugo@gmail.com" <jeffrey.l.hugo@gmail.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "Michael.Srba@seznam.cz" <Michael.Srba@seznam.cz>,
        "mani@kernel.org" <mani@kernel.org>,
        "yishaih@nvidia.com" <yishaih@nvidia.com>,
        "jgg@ziepe.ca" <jgg@ziepe.ca>, "jgg@nvidia.com" <jgg@nvidia.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "okaya@kernel.org" <okaya@kernel.org>,
        "Anand, Harpreet" <harpreet.anand@amd.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        "git (AMD-Xilinx)" <git@amd.com>
References: <20230131084049.23698-1-nipun.gupta@amd.com>
 <BL1PR12MB533354263F0C9A8D5234272E9DA39@BL1PR12MB5333.namprd12.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BL1PR12MB533354263F0C9A8D5234272E9DA39@BL1PR12MB5333.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15/02/2023 13:52, Agarwal, Nikhil wrote:
> [AMD Official Use Only - General]

We keep seeing this in our mailboxes, so I wonder - what does it mean?
That following email is an official statement from AMD and you represent
the company?

Best regards,
Krzysztof

