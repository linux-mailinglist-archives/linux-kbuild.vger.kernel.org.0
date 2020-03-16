Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBDC18762E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 00:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732859AbgCPXWW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 19:22:22 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:46048 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732855AbgCPXWW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 19:22:22 -0400
Received: by mail-pf1-f169.google.com with SMTP id 2so10790521pfg.12
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 16:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XCsQ/k1gBV/18LYol3ef0MZv3s43qrFq6lqu27zJX+I=;
        b=nK7Ie9XJw5v26Hn9++3q2cCgjfpDc16bcWQYnYDxyhNE5zvUaZV7qjljZLcIOAbUyl
         HtwJE+U1eNM0hUxrOPrMXifvCobhjp7TtWJB/hNtku3RA3V6wA0knNMiD+dGwKZA8tox
         BU7DFPmC420FHqkQY3BsDpqVrwAPZP86fwWvrp5oTtw5kNq7/z7ArhSikyS3QajkDbnV
         CgC5uTEQT/RPlGMzaVazrIoUgUvXrbTguZa4JPS6DB16OIDT+pOOU9GDQu+lP4Xip2vm
         ZsvO19S6fvzYwzvkGK4AOPABsDWJxMe1aGdjV3abZcV1CrNM/0oPALIXNwSrsRCao8mL
         GB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=XCsQ/k1gBV/18LYol3ef0MZv3s43qrFq6lqu27zJX+I=;
        b=ZdpusSW7ohbLI8zW5/pi4prtzuoHKif/iqm5I/1CqHIzVI2UuISyEHCOzsVWpOzqKU
         ehtbqkBuPS+5vYbcpUN+zjWCjBflCoRqk5eqCrTyOi6iah5Enlo78liYKq6zT6MrZV/5
         HbyBpEK3OTc5LMw0Ffm3c1Pd0iVLYG+BXWpOJSrLIQQW2ek2OxXwPdhTpBwN6u4tqvUt
         awLwMSnB+Sgi8uHK9fShvnngbrmj9KniwGeER4TcvBv8V2wyDwHOxDDHQw1t9xB63bA/
         bExfs2MNZNrmKC+JAcewiS8p4U1e0/vdYUGM2A3dKMMc5jLRziTj890AikvC6c+VGHmz
         zJUg==
X-Gm-Message-State: ANhLgQ0wujHwQTDtfgIHmMp8jtoh2878v7AM89CNULTknStYanuYd3eZ
        Yr1DQQhCsbcNKolV+VYaf1DS//PDjJnQN3wv4vw9wncJ96w=
X-Google-Smtp-Source: ADFU+vu3N/KUY4EcoPRaTNAyktCTID8158oP7/THa6w63HmLnfuCgJBgaRiyNBfkiY/3TGCpfFzjs2k29YTN6CUh1yg=
X-Received: by 2002:a05:6a00:42:: with SMTP id i2mr2085389pfk.108.1584400941220;
 Mon, 16 Mar 2020 16:22:21 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Mar 2020 16:22:10 -0700
Message-ID: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
Subject: linux-kbuild missing from lore?
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,
I noticed that linux-kbuild@vger.kernel.org seems to be missing from
https://lore.kernel.org/lists.html.  Is that intentional or
accidental?
-- 
Thanks,
~Nick Desaulniers
