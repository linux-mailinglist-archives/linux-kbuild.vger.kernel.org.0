Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613AE19F329
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 12:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgDFKB5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Apr 2020 06:01:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36324 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgDFKB5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 06:01:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id k1so7251486wrm.3;
        Mon, 06 Apr 2020 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=YzmMXR5rNZPtC86zvMRgp4oCyOtVaABF9wgIVshKUW4=;
        b=gxJuXYINMA6TTC8wuTzGOaWVvfdkcVLMnRKU1Ii1lnkAsnPz2965x29SwCgMv225Si
         O4O5QPrC9jqsgfivQfknFkPHpINpRhBLVdC+1zWF2zYzBiha3FzPKTIidV/1GaAexobV
         GSfDZO88re0FoVr3BLwGlZAM9DAnXzIK/C8BoxXfeLPEaVUfEIHETy01Umg3//1qCr4p
         VDCn1gY/yWFa4qqTqBerWz9V0rshhKg5pHfXzOOFY2ORojh0YlKagWaEgtqRzaR7L99x
         1poKuZHTJ7RRZlx4z4n9oLYqdS/P46mMysw3s8yaAOF6J90UewZMfZINfnUszhnTdSMi
         080Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=YzmMXR5rNZPtC86zvMRgp4oCyOtVaABF9wgIVshKUW4=;
        b=tOu5TgLZX1dRRoFuEEfVd4aHdGSJjSRMx+7Nr/dQMGmvHbCgYvQ6aDDebT7HMqU1DF
         cQGACsLdFB1+AZvWhGlmJ4PEp1694FUCVYoAOPS7kBxO9NJRidHmv6NI33ALJN7qtMbP
         xzbObMjtcb0M4XPKwomQ8Ec8M7y6NYqAZ+heVDq9Gcst+jsYUrWis7tKbzJMC6q2JS2r
         IR+VgKI4kAi+lZbYxwvA7z7XLGm3fthcYtSLJgTnQXbbLDYzczTHBr8Bd04YVmEjJo3k
         nDVrrg0WbSJ4nRK83nP9dN9cVPAWh/XUj+UXIpQ1P3LMdBuH3T0/l2rsYGHHTxcwt1sI
         BUNw==
X-Gm-Message-State: AGi0PubcOONZRmbpVcAPBtlV2jMo+y3RIvdyUIA8kMCy3RWWQMwYYQ7D
        bj/sHO2AXjG2U2QqcIgjoDKDIh8hYrvRScE+IKA=
X-Google-Smtp-Source: APiQypKdiuOwo8naTpsrSPB5xSBWnI12Pc8gnVs1udE3VqYTg+4byJnBdfF7ALwaBDV5QRhywnpO473osUYaBiMEbSw=
X-Received: by 2002:adf:bb94:: with SMTP id q20mr8443986wrg.179.1586167315127;
 Mon, 06 Apr 2020 03:01:55 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 6 Apr 2020 12:02:15 +0200
Message-ID: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
Subject: kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ Please CC me I am not subscribed to this mailing-list ]

Hi,

I think with your patch in [1] line #56 can go away, too?

[ scripts/mkcompile_h ]

53 # Generate a temporary compile.h
54
55 { echo /\* This file is auto generated, version $VERSION \*/
56   if [ -n "$CONFIG_FLAGS" ] ; then echo "/* $CONFIG_FLAGS */"; fi

Thanks.

Regards,
- Sedat -

[1] https://patchwork.kernel.org/patch/11473667/
