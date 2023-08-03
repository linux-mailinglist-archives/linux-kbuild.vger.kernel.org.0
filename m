Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC7876EFDF
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Aug 2023 18:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjHCQqN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Aug 2023 12:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235173AbjHCQqJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Aug 2023 12:46:09 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8BB3C20
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Aug 2023 09:46:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so5132395e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Aug 2023 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691081165; x=1691685965;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YC3d1j2I1yC422v3xyoHJMuPWxAqdpxOSzF+Hk4x4H4=;
        b=wEcnufdByFQUzKhkAR4oqMkIQunllrGNaIZZ7HRkBzNC066q2f2aov78u5RsK+gqs8
         27UyUsrjM9ZxpoRHznlVtbalhkkQKh9yhm441bCf3omuQjw9cYatRnxPrL+33vR/zaVL
         pUPEeTS85vyKRmOI52rlBFLyEbpqYive/5qWGgNCrq/KrzGEkXo1esCY8vMjpqR1pX7V
         ubyYL7RW3GtFI9/66EurfjGP5xviCtYB+eku7dqhCrTfNWkd4TkmwJknLGgr5gqc1oRR
         sDNf6zBsBHYWTZy3ObP35GYBDel9GGP/345/HVZUywXw+tKCAbyQX8oBqpnehSpIC8P/
         9WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081165; x=1691685965;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC3d1j2I1yC422v3xyoHJMuPWxAqdpxOSzF+Hk4x4H4=;
        b=eW95VidM4R24mX6qrDme/d57AODfz3d5PmYTHYEJSS3FtcuoKt5mLNLe6vvdmWZogj
         Sh5rBD+evWqBkjtBMcp2J5Z7uWs+mwMz3hS2KUqoPm4kgTClw2k+8Jx9DvPWqDm3GEOr
         lfacrTrNkgfm69k1mQa4xtdJUV2FgsHIhlRM0bVSJJtdHJlH0u8Wm7Iv3JC/SKOeKTtU
         TW2mZqu5WW6R13mf3YhxwJGhNGI5lrlSX0s8WaoNm1aelRIhPeBy3+IU4K37PtE8p2VE
         JEs3Z+5TDhpEaT8e71IvglFv6DgWJ5SnvXPNKTcCZlgp8nb8NSufU/DvJP/Yjfxk/F6o
         zUUQ==
X-Gm-Message-State: ABy/qLakDBT9EBxJwxta03CyJOw2AaJSO1Hgb8XF4DjFSmMZrwYfuRdq
        aP2LeKPYq9RsIPWSEfoH9/8g9jAYSsU0uvuy6mY=
X-Google-Smtp-Source: APBJJlETs6uwisxbpa4wunOtF6+movbaqfhvchwilMeuR73exSYgiFqHh4aVkUSvu0L4w15sHxJbbA==
X-Received: by 2002:a7b:c7d2:0:b0:3fe:1287:d2b0 with SMTP id z18-20020a7bc7d2000000b003fe1287d2b0mr7780049wmk.3.1691081165344;
        Thu, 03 Aug 2023 09:46:05 -0700 (PDT)
Received: from [10.1.10.62] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003fe215e4492sm320878wmc.4.2023.08.03.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 09:46:05 -0700 (PDT)
Message-ID: <913b3d89-47c5-f9a8-462c-6a28c0fb29d7@smile.fr>
Date:   Thu, 3 Aug 2023 18:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: oldconfig loop infinitely with a hex/int config without valid
 default and a closed stdin
Content-Language: en-US
From:   Yoann Congal <yoann.congal@smile.fr>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
References: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
 <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com>
 <e14f2645-f8a4-fb48-9e29-d6886b22711b@smile.fr>
Organization: Smile ECS
In-Reply-To: <e14f2645-f8a4-fb48-9e29-d6886b22711b@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/2/23 13:29, Yoann Congal wrote:
> On 7/30/23 10:59, Masahiro Yamada wrote:
>> On Sat, Jul 29, 2023 at 12:23 AM Yoann Congal <yoann.congal@smile.fr> wrote:
.../...
>>> * Should all oldconfig/syncconfig/... exit with an error when trying to prompt on a closed stdin? (I might be able to send a patch for this one)
>>
>> No.
>> I have seen multiple scripts piping the 'yes' command to Kconfig.
>> There is no reason to prohibit pipe or redirection.
> 
> I agree, I would not want to prohibit pipe or redirection.
> 
> I'm specifically talking about a *closed* stdin. A closed stdin is a case were we're 100% sure that we'll never get a valid value. This is why I propose the following check :
> - closed stdin
> - default value is not valid (eg "" for a hex or int)
> If these two conditions are true when prompting, then exit with an error instead of what happens currently : starting an infinite loop.
> 
> Would you accept something like this?

I've sent a patch to make it more clear/concrete : 
[PATCH] kconfig: avoid an infinite loop in oldconfig/syncconfig
https://lore.kernel.org/linux-kbuild/20230803164022.2232051-1-yoann.congal@smile.fr/T/#u

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert
