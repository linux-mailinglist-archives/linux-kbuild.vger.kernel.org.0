Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF1922E0B4
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Jul 2020 17:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgGZPdB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Jul 2020 11:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGZPdB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jul 2020 11:33:01 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D47EC0619D2
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2020 08:33:01 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k4so12295978oik.2
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2020 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=aO6sJz0ss7cLm8Kei6an2LEQl/kyo6eYih60LLTau04=;
        b=EKbcVqL2Jdo1feJzqs385KR8yOFN/yE7Un2P9Y2wdy/DjhA8b9y+tmbHyDAtNIKXBJ
         gjdL/7bdiJdSAtpCg09r+enUKny5B3LhROAyBAymlDXs7uDLghPxs/cSkxflZMRfNtmZ
         5OjQaaNBn0U5ozepx6iQwJWmNtE8drLQ/Oyy1cQGq+B03Ek4vO0xIieNgH1YDJvDGvrE
         KDmsr/4+mdA2G+t4ERYUeiDWC22XLKBulWp2TPYRyijjpFvybhYHpElmF+Ves8mqkpCN
         Otc4pfJP5nj1rFmYjVwlD4KQ12nrti2NgAzyrGPMYhgIcwJRY2LujSsbO26pfp4Aeocz
         8/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=aO6sJz0ss7cLm8Kei6an2LEQl/kyo6eYih60LLTau04=;
        b=hEg4jVGxh8W+kPQXolbyvpaLGeUrLEwoRhExEZJgUoAH8c86HlTOi9jrW86uBoMsN4
         kwJkR9X83cD5vOCszoiCqj/ObXdT+NaDQjXdE709jlllZWqtNC/3wahJfNocQ+jy2juG
         khk30ku21VOx97Jy8jgJKTYIp1szJoEB02CvGpk7TSfgGXycoLvcnc+/cJhou2OVUsmm
         S1N7iRd3o43KmwFuz/hgn/BpYBrRys8moto/4C9iRfLgESknPvGgFs1q5bPRy1NDqicE
         0aLU+UNSB4Rm5rlByTyGWti4ZvDXA973l8ARWhKFJaMrvY5NhAAdz0f3Az5PVmdybzUJ
         pMcw==
X-Gm-Message-State: AOAM533z9o8XUYxDCCWh4p4JQuKWmeCDU5xq999Qd0hB7IB5WWRT5USb
        Ce7ArZOWFCF5Bv8FjmsIcg8PmwwDbed/ty68gV4=
X-Google-Smtp-Source: ABdhPJyPL3p4bh7Wy7z5s+8p7IBqwBxtWxRlSswS9apLBagKKy8F7+EmC1QOTN01plw8V8C1CPls2jzBBBsUhRf3VOQ=
X-Received: by 2002:a05:6808:5d3:: with SMTP id d19mr14388547oij.145.1595777579528;
 Sun, 26 Jul 2020 08:32:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:614f:0:0:0:0:0 with HTTP; Sun, 26 Jul 2020 08:32:59
 -0700 (PDT)
Reply-To: jinghualiuyang@gmail.com
From:   Frau JINGHUA Liu Yang <oncesmart3@gmail.com>
Date:   Sun, 26 Jul 2020 17:32:59 +0200
Message-ID: <CAOSmJiuzUBneXJF8YKgv-DnXXa1nmpD-ZJNiYhmU4qdiMc13nQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--=20
Guten Morgen,

          Ich bin Frau JINGHUA Liu Yang f=C3=BCr die Mitarbeiter der
CITIBANK KOREA hier in der Republik Korea. Kann ich $9.356.669 USD
=C3=BCberweisen? Vertrauen?

Mit freundlichen Gr=C3=BC=C3=9Fen
