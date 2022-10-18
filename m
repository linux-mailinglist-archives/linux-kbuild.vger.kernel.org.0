Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E4F6029B8
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Oct 2022 12:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJRKzx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Oct 2022 06:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiJRKzv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2022 06:55:51 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FF5B2F
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Oct 2022 03:55:49 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id i6so13425208pli.12
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Oct 2022 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLINuXNLtU9OTTNSNyr45b8tgX2olJkHTaYrlc4FLMY=;
        b=AvvfJJx5gAzzk6lxK+wd26zIA6hvsiPk1ZtVSUKFG3/50sy259nGJXfpSB94Bzuamj
         t4Nw47eoT/kZxK5eNCu9BFqsTZVuhQcbmbQGEsU6KOcyOCKSYxEahLPkToN0eio5iZnT
         7TxXc9DPGbgM6N/Pkg3Bl/JiAgIkJmAFRQHwj0xrY4GAGPQ6dJUclzFccaeMRCNSmdp6
         GS6TPYCffisqFhXDejrK2nLvdbEFNsADuLTvsLlr1jcAeBV5zXc7407O0vLqlqFlXnoe
         D1JRYmkiO2oMQb8CXEcSHi4YTHGzo6md9eqGnjvVsrlu9G82dU6FUgF9H1mRJ7pByL2i
         LBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLINuXNLtU9OTTNSNyr45b8tgX2olJkHTaYrlc4FLMY=;
        b=Fc6UEiRC4OSse+jOuVNkKCFUsrFCA1IU5Xj/H3lBl/LW12WpPzpBFOE8+/9bTfSgda
         xslSGtUtVedA3f189IKvc2LP4uUmzoPEnIz0BSFC/ePpb07BG2IJPxQi2gTNTVuYbu3k
         Oxrbmpuvh6t1OkJH/63ocSGO2kRcM1iTjXg8a3euY7HowQTnUymIiYEV8VlbbclUJq92
         8XAtmDwKXKd1D+orDQP5mT6mzEl8mufvwN9HSCFEXcVdZsCY4glzijYMvLOS6iOw/H2o
         G1DwI9Jgdfx7mGMfda+4AMb1jYzJukYLCqeBwUm8tlwsl/F+K8XXE9sCt8l2m+cd5IRl
         detg==
X-Gm-Message-State: ACrzQf2RB60zLwqywbAYc4+P0ZzlDjRYnXrIM2x17BPCwAeJDVCY646v
        fIlNW+KKG4HoymFMj437Uxn+Pw6tAhEJNz7H
X-Google-Smtp-Source: AMsMyM5VtbTfwhbV3RfqUQUJRdioqFYoASfbuOal1sg3LVaYGyCoBtPU6VKQB2TskT1XFAn0+5Fhtw==
X-Received: by 2002:a17:902:e40a:b0:183:f90:2fb with SMTP id m10-20020a170902e40a00b001830f9002fbmr2652844ple.28.1666090549306;
        Tue, 18 Oct 2022 03:55:49 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-86.three.co.id. [180.214.232.86])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a7ac800b00205d70ccfeesm11063883pjl.33.2022.10.18.03.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 03:55:48 -0700 (PDT)
Message-ID: <81aa8527-af8c-aff9-f805-5412a0531238@gmail.com>
Date:   Tue, 18 Oct 2022 17:55:45 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: 6.0.0-RC kernels trigger Firefox snap bug with 6.0.0-rc3 through
 6.0.0-rc7
Content-Language: en-US
To:     Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <Y0Zw2eHEb1aZ9f4y@debian.me>
 <29362d2e-eec6-5a23-4354-cf8868d50b2c@alu.unizg.hr>
 <6375f31f-316a-bebc-6aec-c6241049e401@alu.unizg.hr>
 <7e0b733d-db73-f9a7-0965-4744e63f1a33@gmail.com>
 <fa6c69ff-a493-a519-3564-1a1ccb932553@alu.unizg.hr>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <fa6c69ff-a493-a519-3564-1a1ccb932553@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/18/22 16:36, Mirsad Todorovac wrote:
> Hi Bagas,
> 
> It would be a great speed improvement for my testing kernels if ccache gcc worked
> for me, so I wonder if you could give me some advice.
> 
> I tried the latest binary release (compiling on our Debian 10 Buster is impossible due
> to prerequisites required), however, it did not work though I saw that it cached
> objs, but it also recompiled them each time.
> 
> Now that the building cycle of 90 minutes appears too long, it would be prudent to
> have the ccaching system working.
> 
> Are you willing to give some advice?
> 

CC'ing linux-kbuild list, since people there may know this issue.

-- 
An old man doll... just what I always wanted! - Clara

