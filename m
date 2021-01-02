Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DCE2E886E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 21:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbhABUQC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 15:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbhABUPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 15:15:32 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90111C0613CF
        for <linux-kbuild@vger.kernel.org>; Sat,  2 Jan 2021 12:14:51 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id l14so11219608qvh.2
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Jan 2021 12:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:mime-version:content-transfer-encoding
         :date:message-id;
        bh=NQTw6CZ9m2eVRRW3/Tq2Et1PomEwPWcsO5QPEkGfZEY=;
        b=Bj6Cz0+u/t5B5949yZWMmCcwDI7PiscB5GSikTL91qXMiNvVqj7Z0JfmkjJhBb1znq
         Oqi0mbvTD6Ss+BXe0+O+mcWGNOKrwxrnOJxgjUQSCBqWEdYWBJHK4TSRwpsJScnFCU3x
         SUgkTMeC24wDVnlx5H4zWDEE+P8t6ukxT7Axedb5/LHK9B8vCjcnm3qA27cW7w0SXIO7
         yzQMSXF5kZwzBDlwmtgQEdtZ/Kq184dfUIm2I0RYWR+X8C6jPdh4HiAh9Ori+YEZcsKD
         fwF3LN3/ayQ9CQkIWx1rS4R6BqxPRLBhjq97qfLkN6C2zuaS82dNMsgXAfQ4kA098kcK
         ESOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version
         :content-transfer-encoding:date:message-id;
        bh=NQTw6CZ9m2eVRRW3/Tq2Et1PomEwPWcsO5QPEkGfZEY=;
        b=Az1eeTu8DqFWqJmmQnwlNP0+6iriWxWbpsFU6rz5BFDiJ4CHYvDzzsKVL9BaQuw6FF
         e1n3IK64/R2Ds0LL3diGSSTF04eyzLjKG+w7KMthADRYNzAW1GMahnnApDSrHC0esyXb
         jtyCZcbVYyneiLvfTPW4IYey5gpfo/M+p8Oi7KfPHQx/hx5+bPQaNbaFcZlJDFFihCCh
         oH0CrZ7CsrdD0qIa+qr8KQtt3edU0iFlHco/JSHwG3fyHwCE8jYsAOabzZlgVnjLm3CQ
         4DQlUscdc++roY/GYemlFU1WR1qwNLXKjxLctYsnFSFEdlfVNRLgURUncIbIbRjVhYnt
         wYnQ==
X-Gm-Message-State: AOAM530E5XjNe/yyCfBxH5dS+pIXQw5JOjH5hkGm3L6rS9HPB1Ynn8Af
        48lQvd2WXzC9tChl5Dx+NkUUmw==
X-Google-Smtp-Source: ABdhPJw1BbTelYuJUkoxt5+eTdsa80X+kyf2xVm9S/mU+gJguTRG5tYjVGBgY4fVo7yTLps250LI0g==
X-Received: by 2002:ad4:47c4:: with SMTP id p4mr70423598qvw.23.1609618490494;
        Sat, 02 Jan 2021 12:14:50 -0800 (PST)
Received: from turing-police ([2601:5c0:c380:d61::359])
        by smtp.gmail.com with ESMTPSA id p10sm34341099qke.32.2021.01.02.12.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:14:49 -0800 (PST)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "David S. Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Kconfig, DEFAULT_NETSCH, and shooting yourself in the foot..
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1609618487_2273P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Sat, 02 Jan 2021 15:14:47 -0500
Message-ID: <16871.1609618487@turing-police>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--==_Exmh_1609618487_2273P
Content-Type: text/plain; charset=us-ascii

Consider the following own goal I just discovered I scored:

[~] zgrep -i fq_codel /proc/config.gz
CONFIG_NET_SCH_FQ_CODEL=m
CONFIG_DEFAULT_FQ_CODEL=y
CONFIG_DEFAULT_NET_SCH="fq_codel"

Obviously, fq_codel didn't get set as the default, because that happens
before the module gets loaded (which may never happen if the sysadmin
thinks the DEFAULT_NET_SCH already made it happen)

Whoops. My bad, probably - but....

The deeper question, part 1:

There's this chunk in net/sched/Kconfig:

config DEFAULT_NET_SCH
        string
        default "pfifo_fast" if DEFAULT_PFIFO_FAST
        default "fq" if DEFAULT_FQ
        default "fq_codel" if DEFAULT_FQ_CODEL
        default "fq_pie" if DEFAULT_FQ_PIE
        default "sfq" if DEFAULT_SFQ
        default "pfifo_fast"
endif

(And a similar chunk right above it with a similar issue)

Should those be "if (foo=y)" so =m can't be chosen? (I'll be
happy to write the patch if that's what we want)

Deeper question, part 2:

Should there be a way in the Kconfig language to ensure that
these two chunks can't accidentally get out of sync?  There's other
places in the kernel where similar issues arise - a few days ago I was
chasing a CPU governor issue where it looked like it was possible
to set a default that was a module and thus possibly not actually loaded.



--==_Exmh_1609618487_2273P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBX/DUNwdmEQWDXROgAQLg4Q/+L5yhR7DcbE3S76pyo00K3oJHl/tAchR3
f1EkfqQkxO/6x7TQotHGUiVoPmWpY96nBPt9yocTMD+RC9rNg2wv5EeCbozHak+B
By6upU5lV/sLEMZ0G+ClOMdsbP3ppK1dAs6aD60VKikEXBfH/VA5SDXmK3gROPLx
Yc9DGFbSZwFFQ8mtVO9gVJ7NSj06dDSUuZdxNpRzN0cpzcCOCWzktn7gDTw+3Jgt
rPLEiTLSBM0IcK4PJ5gEypR7bVG1/223wHAXFgyJC+8AqJOsPLywri9AwUShi3mQ
/u7nAiIo0Qlz/viIpde7bMN6RlKzQHcWvH7qus6hWZ5HOyc8UBE8bDXYSrr+YB83
E7IC5dv4deZuC1YDePkjWo7hKH+WaoKIYQsDK6MY+YQ7LbqxV4aqU+ecB6AYdZBc
RYfUfFdKNDlkA/mWD0Ez+4OUMf6U/fXhaNwHXdUpTRqOF8TbsvzDc5g9sJOGGQZp
6eUYSH5vr+qI5CFSgcpKRzRf1wAzMS+jBmemzBlhIWaw9+aM6NcMhLU1a/iCE6Fm
Q0U8hlzef3FqWFnAKchzCth+IpflCa8+bn6Ue7HqEyEyDMl3ej038xl4+kQSxLpI
Krbl3VVGt8auExUsSVRHTUk/c+s178ARJf4KuDTeivSUSqv0bWQu+1CrRuZnX9Lv
FDKICwWsjxQ=
=SQQS
-----END PGP SIGNATURE-----

--==_Exmh_1609618487_2273P--
