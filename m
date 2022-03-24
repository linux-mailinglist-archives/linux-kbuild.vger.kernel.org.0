Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC0A4E60CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Mar 2022 10:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242899AbiCXJDX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Mar 2022 05:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242592AbiCXJDX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Mar 2022 05:03:23 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078A19D0CC
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Mar 2022 02:01:52 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id a127so4176860vsa.3
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Mar 2022 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=ij6cRTNlc8XtejVBZoMz1xawiDrP99m6VpQITlsEFWbcu4xAWAxt2GYqFaZ92j96h4
         X3LTgKYzjjtBQ7tE051M8eA2vqR3LYFgxcUx61tkUdhBXLfEGjX9B3PtqnqFIgtmmUbb
         xlziu44IaZpOqatCRi8mzZcClawhAPlonKRqj3txGtsFBAatG2l3t5XXKoW47YQ1SOna
         v6FbfxkJkV3dHfXLwoWt+m61OwuZsUjSBtbJkFal2ST1u/zoSmgi8nRfDP8kun0Lq836
         sZV6tgC3LG5teGCePw7TQysdCU0Ka3tk3awYH3VX939yErh6TDDG+1fd/ZOrtKU1C339
         P1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=c7hxbT3pdwArh3oqYZStvJCvy5+5Bg0DQuR+pz3nGwBclrusj1o2hQ/qltuZrlT3HR
         1hHBwCT5u+harIOaU17PRR/Fv1Abq4aWfieEmbPdEt9B1ubtv6TzrRHCzzV5MwfqOHBk
         SF0iSI0rvLh1u4gic74unJStnVP7uFLuOZThxzZfeXpLrV7CiB7tnlMLfqKcojNkRlO/
         oLIqZxHNexzwfGLtmkTmQlIdN5/B5rt9iYSvSaMz5FyKNKk6bz1tXsBUTp9aItsPXy0k
         rJDEjqwiWn8zSv5E9fpkyZyJ2HaqnnIYX5QE8EeSIop17ALWdZhFtU3FBZx3IAB+k8Oj
         Ww8w==
X-Gm-Message-State: AOAM532zISL2V7tl94eHgtRK25CrdUEebDTphzE7I5HF9iajCNIB4D7D
        RVpkHemzcZ6DG/JgeUBM1NfvtpyosxqV+L6JQp8=
X-Google-Smtp-Source: ABdhPJyy1N0HFTAzWCEsqJqg2LphvoqdulgW/gcO1/r/zyaIiMlGlcsQIge39S/G+BoU8VcbGjfypP/C4v49C6My4f0=
X-Received: by 2002:a67:f6d9:0:b0:324:ba1f:1a94 with SMTP id
 v25-20020a67f6d9000000b00324ba1f1a94mr1869167vso.42.1648112511109; Thu, 24
 Mar 2022 02:01:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c6ad:0:b0:29e:8e5a:2597 with HTTP; Thu, 24 Mar 2022
 02:01:50 -0700 (PDT)
Reply-To: ozkansahin.gbbva@gmail.com
From:   OZKAN SAHIN <jacobbarney6@gmail.com>
Date:   Thu, 24 Mar 2022 12:01:50 +0300
Message-ID: <CAOPi97Yts0E=DBcpuLOn=HTdhv2xmq-vfbT6MjXtkJ4GFrt-nQ@mail.gmail.com>
Subject: Hi Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e29 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4938]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jacobbarney6[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jacobbarney6[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Greetings,
I'm  Ozkan Sahin, and I work as a Financial Management Consultant. I'm
thrilled to approach you and present you with a lucrative offer I've
prepared. If you're interested in learning more, Please reply as soon
as possible.

Please contact me at (ozkansahin.gbbva@gmail.com).
Respectfully,
Ozkan Sahin
Financial Management Consultant
