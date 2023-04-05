Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B876D75F5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Apr 2023 09:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237184AbjDEH4x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Apr 2023 03:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237129AbjDEH4v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Apr 2023 03:56:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85064C26
        for <linux-kbuild@vger.kernel.org>; Wed,  5 Apr 2023 00:56:47 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h8so138974918ede.8
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Apr 2023 00:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680681406;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2eIUIgQam+Znm92t75ub3SSql/5kD/CSnGjaZOIeRE=;
        b=TbfE/M3KLTLcH5vT2Fre6fZYOYPWvvtxQkGTov6z1yTYm3WWX0o+lTIhTOG+wcSwIr
         Shh1zY364kogmQhRAc0fmFUnYMo7ZU5Ky8ffXUG3ryGAwkPV8ypCT8eTFfjq9CYDvF34
         wd9tQF0WuIJQpr3lhmr30HlFr0l1LwFrvYdgr8mH0O6e9FfWr5OPxhkLBM/13q30F9ig
         EG1EUr+OVaWTOJKmPFrxHNqGlS+65K8SsVkrarg61QTLcPElkQBRwd5OoyrukvetA/wf
         Vqy9Mst7SvFcranOTqZhNf+dN08TZqf8qZtRsH7Kuac3IsmXwWAy0wOKyifHo22AsbGf
         ub3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681406;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2eIUIgQam+Znm92t75ub3SSql/5kD/CSnGjaZOIeRE=;
        b=V2HWORZgglhjd9DoYNJzorsCUCZC5RSES11MthAFZ9xMR4FSOoA33z8gAG5gdyjrfL
         R5cfcXE0ejhOHrtMXV7hIjYcdWW6fx6MVAoAmh3nS3zb/8MVWhp+xhuI8OaSbn2VQ6zL
         rYw+Q/b11xYbTjVxD/wGK/ihWUoB0/p3p1YbfiiuQRGV2Y2yS8/2YhZbO2C1AUeynl+x
         j90Lvg6zfWlABSeEfPceZwbWy3hY/JUPDlpPR1TaE1Yxj6hcGPz+afxpPDKAeWme6Cpy
         cQRriK165MV0SfH4h2Ax41Ax+LdtlUeEGA2AY2/5rN8+P+oT4KgboersnIc/cYxYSiil
         lY5A==
X-Gm-Message-State: AAQBX9c9BBOZe178qFW9YDfGbVbJDzeYlLZ+mhfCSMPQJE818cHBrTSt
        XstUC3wRSz/lYPJkq7afyo3EU0DxKFp2GGikgKg=
X-Google-Smtp-Source: AKy350aKLqDIJOBs2+w17/O65tIzNsWo0HsCJMoNyTEOl6/xftBTjTFN3K+wYTFKjUWLGLXPGVtupVTP2HNAQxlPhhQ=
X-Received: by 2002:a17:906:f8db:b0:92b:ec37:e4b7 with SMTP id
 lh27-20020a170906f8db00b0092bec37e4b7mr1145683ejb.14.1680681406051; Wed, 05
 Apr 2023 00:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:2202:b0:65:e547:3943 with HTTP; Wed, 5 Apr 2023
 00:56:45 -0700 (PDT)
Reply-To: tamimbinhamadalthani00@gmail.com
From:   Tamim Mohammed Taher <cisskhadidiatou890@gmail.com>
Date:   Wed, 5 Apr 2023 00:56:45 -0700
Message-ID: <CAAYY=dY1_XALb_mD3qTfxhx_hk9X7aOuccJ_bL2QrungoJAyKA@mail.gmail.com>
Subject: RE:Saudi Arabia-Inquiry about your products.!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=DEAR_SOMETHING,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:534 listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [tamimbinhamadalthani00[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cisskhadidiatou890[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [cisskhadidiatou890[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.7 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear Sir/Madam,



Can you supply your products to  the government of (Saudi Arabia). We
buy in larger quantity if your company can supply please reply with
your products detail for more information.

Looking forward to hearing from you.

Thanks and Regards

 Mr.Tamim Mohammed Taher

Email:tamimbinhamadalthani00@gmail.com
