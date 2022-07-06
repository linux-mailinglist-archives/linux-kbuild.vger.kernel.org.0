Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA87568F24
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Jul 2022 18:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbiGFQ2C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jul 2022 12:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbiGFQ2B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jul 2022 12:28:01 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C839127FD3
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jul 2022 09:27:59 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so21985791fac.13
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jul 2022 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=j3Iv1xBLwra5/UwrJF1NWDBUQ6GgzCnHDHHIxb0t14iKZhX5UuaFu5sHypjuwje33j
         8V0sL5TNLGvbIP5RlSvkv1MO2V/s/pJsWITqGQHD3C4CsD7bUbfpWGcPFcaF+LsMY6Kz
         vEfbGF7+ypXI0vZZa2NBkV34Cw6zwUlJ8hd4slykDHkCX15z5ZLTGJBVtCGYi/U3USp6
         8FXEn5ryM7erRjUIqrZn4+ciQq2GuEKDOwwN20ZWOfKy8Yhab+xA/vc/OBrgtNHuVjFO
         G9hE6KO7kG4W3Yu7oQWex552HWfcW+JyP0iLPQW522cOLLQH1ksCcKFQ8iDhU1i4IHEr
         x7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=ammi7TAcXBnAiWLnjXQ6QDFvAeTveepWnaQS7bj3DM/wydh6zrwe340wlGnjwSSDkm
         cZYE+W80qj5HHBuISfC3gRI74zLqoixvG0G8k3e4CB//qWl0HkQ9g2MxSjBRjr3XHAjS
         YJa0uy0n/a0oR2SQXZc5Iral8j/cuXcXXKIvWC/KlvDURSKUSqq5RgtE5oNoCQAodmrM
         1HFyEFBcb+IELAbZVQgbp2NE1i/Ghcs0rTGwMPzgYK59pg67FwV7ahRsQt/pqtVw+UMW
         HvmxdBTr9HVyHWES7lJzJexgSO9Ag4bYTsxWYUvzWF/uOe7XE52cTEsSPrTE09HWFSrD
         PT2g==
X-Gm-Message-State: AJIora9l66EOHbUPQPSSxR1n6M1UaXdSgRmcbGapAnCMoYm43Hl9NLBp
        7ETHZPh3rZ1VHM2nHZIivVq/vjQ1wS/dKsxyZ6s=
X-Google-Smtp-Source: AGRyM1s5FmLRUFsvV9y0RYj/twKb5g1BUwc7Mx+uUhIvLMYEo5sG0Nv1uyoVJUOjosA/9u56DJdo1OvKNpM1RGlmL7c=
X-Received: by 2002:a05:6870:c144:b0:eb:5ef1:7d8c with SMTP id
 g4-20020a056870c14400b000eb5ef17d8cmr26652011oad.232.1657124879273; Wed, 06
 Jul 2022 09:27:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 09:27:58 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 16:27:58 +0000
Message-ID: <CAFSKFDbu5djrmtNGDBZiMtuYkRbAv3pBykwbOHcr6djUNxFAFA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
