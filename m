Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C24D2F05E5
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 20:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390912AbfKETZE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 14:25:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54539 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390885AbfKETZE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 14:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572981903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mi8zXsV9StAkuNLQQmkOxXSCb86Evhad3cvP8SJ678M=;
        b=QxuB9COv6B42fsiN+c+zUNcDG4Tc8ec60ZQwLx+1ct2pQ0pQ5SlHPVzujA8rs7Z1T7rL74
        4ZAxpcW4OQONyyjgBz6OXSzdkoB43pj8GZy9irFY2w81PnE1pwn+Hv1n1rI/wapHafEayp
        Us9XrRMnfxZzNwwH+n1ccvpJlCaaqNU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112---VFXj6UOKqCU_VTulo6iw-1; Tue, 05 Nov 2019 14:25:01 -0500
Received: by mail-lj1-f198.google.com with SMTP id d5so4541023ljj.2
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Nov 2019 11:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nNaeMHw3xwJlxet/C7/GFJpDlb6Lnx4FzVDVS6q4vwU=;
        b=LmdAQVWEdbi38ExL+Mkcz7l2D74wJDtuikuOeyFE0AEmwADqSFuvXjQmJ1Ffvmmyrg
         Q/nOghscDk8IWgZDeTg+CmqltEoufv8ZPWLIwdEJc+W1XKtwCQFHR4eGiEYDyxKKsfAI
         Hmcsp7VgQGWiT1ypR+EjfZydwx56Gyzl8vLfZvpvKBEtsgPtVTNKG/7F9gOfs0ogAkgX
         NuVR1fsr2l/vlCzAFXhYgs9Qbq6t85ftdFB6xaZfKmUHIs0IvWk08pCxBEF9d/J+35Lw
         FH6i/A1cZnm1SLgwpHeD4Z56RHit3lho+cAG6lSDOtGimv/NmrCJXu8AquxQM9g1Ka2K
         3Rvg==
X-Gm-Message-State: APjAAAV35zFQFJx96UkxIhLt10SbAUA8UZ4KbSFodjAhV/ajgFD0c+0f
        vT10kSUQk2dH6vcif/GHCNcEdCiljCTcGoKoZnetgG9cmQ5ms86lxzGpDvBOr+hP/3SLzuTSNar
        NfIK5haPYLWWcC+mh2Ex6ljOZSUapW0BH84PyCSv+
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr22698845lfi.56.1572981900024;
        Tue, 05 Nov 2019 11:25:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvnBnmUfM/A06b2ws2N6XHrGUXAwSMAUposRLRjOC1OLL4xYZtEaEt8N5wfgTcfWSj7mF+lj+UNwyRj5bee9U=
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr22698839lfi.56.1572981899851;
 Tue, 05 Nov 2019 11:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20191104131144.14333-1-mcroce@redhat.com>
In-Reply-To: <20191104131144.14333-1-mcroce@redhat.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Tue, 5 Nov 2019 20:24:23 +0100
Message-ID: <CAGnkfhzdHWS8-FLPpAsma8ZeszkAujKAtfDcqLvNY7n__fz=4Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add make dir-pkg build option
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
X-MC-Unique: --VFXj6UOKqCU_VTulo6iw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 4, 2019 at 2:11 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add a 'dir-pkg' target which just creates the same directory structures
> as in tar-pkg, but doesn't package anything.
> Useful when the user wants to copy the kernel tree on a machine using
> ssh, rsync or whatever.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>

Hi Masahiro,

here there is the v2 with that nit addressed :)

Regards,
--=20
Matteo Croce
per aspera ad upstream

