Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D35766B44E
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jan 2023 23:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjAOWNc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 15 Jan 2023 17:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjAOWNa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Jan 2023 17:13:30 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332501B54F
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2023 14:13:29 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s22so28240607ljp.5
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2023 14:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrkGBGLupmmxwj4mMNV2Ck4MkVXvEVZUnNhswUiErKA=;
        b=K0VikIGXfgOfLVMJbTJbxo+0erIrcMqd52v/h4t4Tq4cAlwja+9HVOWwf2gFRu9D0E
         2rqkbns3+xUYlxsjK5DTXCMaz3h4R15Ew1UA9Hr3cLLpxJ59bqmrRPIJYPKSr207UfXc
         9i8byWnzv7b7P2mffBi0rcZ+6aKi/N5rvb9HxfyNVhEuMx+WWz01Bz/igh8oF8xotyPt
         FQuNNRIfbiaL+8uJKyOmX+0wAa3H6hc4I+9S58MNXlAzL4MLNxVzwY8Okg9KXO3U+mAY
         OyJKjEGLZivigsOwPn5FfVHcgfxffVOw/8p+IHUumjvp24I9dzkhc8XODFd1YZu4wSBQ
         R3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrkGBGLupmmxwj4mMNV2Ck4MkVXvEVZUnNhswUiErKA=;
        b=eqQYjQk0L3EJGBr4L52Ivsqf57UaYD9m2uVE0yx4x5NI6qlarFZd8Je14XzqMrvzvs
         kVaqMdBtvGmYd/BVBmkSVOVBY4h8G8VLXidvodgYIT140W/xQGj072LFvVVTzLXeGyIJ
         HowlpyVi0jDCnY3e/xDMIq/pDjy5sQw8sYn6v1zFTM4txFQVp4d45tuE+W9c6LrLUKZu
         KzyiKkwi1G4Q8w54h2g338Bbdd9YiASUMZy0gJI9gwVt2qZBIl+lC7E/TzAJeBpdIc90
         bATtq1LXZ0vJYEj5vp0nsVIyFgrqL6+Gtw7ss4kHlklQkeWFMs2kD+kGB2Lm8+z/OZnx
         klQg==
X-Gm-Message-State: AFqh2kpBgJzWxwRUuXdQsVKbt4Qa/HHuGlIlz8PPmYbv6ZNMy+aDuEuy
        2YzaqssRWNBCTKaTp6VGFtGKqpTgC7FXQTERnlk=
X-Google-Smtp-Source: AMrXdXsVUSMvXEqvn2ldSAooIFJ6h/kSpXKppkOrfgk1ta0BorfKnkTC1M/dIK3kgyCiVHRLUGkWKVtRpVsUlyLfhoE=
X-Received: by 2002:a2e:bf19:0:b0:27f:ae14:6ac9 with SMTP id
 c25-20020a2ebf19000000b0027fae146ac9mr3689361ljr.300.1673820807157; Sun, 15
 Jan 2023 14:13:27 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUXjro1-JxeMor=PX-f5K_dxyRj-ue3SUDT1MTERHb1g+g@mail.gmail.com>
In-Reply-To: <CA+icZUXjro1-JxeMor=PX-f5K_dxyRj-ue3SUDT1MTERHb1g+g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 15 Jan 2023 23:12:50 +0100
Message-ID: <CA+icZUX+3V+7XPi_JkV-z5JXhZ+KAVpXsE8ykbctvYyStU_P7A@mail.gmail.com>
Subject: Re: [builddeb] dpkg: error processing package linux-image-6.2.0-rc4-1-amd64-clang15-kcfi
 (--configure)
To:     Ben Hutchings <ben@decadent.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This solved the issue:

# mv /etc/kernel/postinst.d/dkms /etc/kernel/postinst.d/dkms.orig

# LC_ALL=C dpkg -i
/home/dileks/src/linux/linux-image-6.2.0-rc4-1-amd64-clang15-kcfi_6.2.0~rc4-1~unstable+dileks1_amd64.deb
(Reading database ... 426963 files and directories currently installed.)
Preparing to unpack
.../linux-image-6.2.0-rc4-1-amd64-clang15-kcfi_6.2.0~rc4-1~unstable+dileks1_amd64.deb
...
Unpacking linux-image-6.2.0-rc4-1-amd64-clang15-kcfi
(6.2.0~rc4-1~unstable+dileks1) over (6.2.0~rc4-1~unstable+dileks1) ...
Setting up linux-image-6.2.0-rc4-1-amd64-clang15-kcfi
(6.2.0~rc4-1~unstable+dileks1) ...
update-initramfs: Generating /boot/initrd.img-6.2.0-rc4-1-amd64-clang15-kcfi
Generating grub configuration file ...
Found background image: /usr/share/images/desktop-base/desktop-grub.png
Found linux image: /boot/vmlinuz-6.2.0-rc4-1-amd64-clang15-kcfi
Found initrd image: /boot/initrd.img-6.2.0-rc4-1-amd64-clang15-kcfi
Found linux image: /boot/vmlinuz-6.1.0-1-amd64
Found initrd image: /boot/initrd.img-6.1.0-1-amd64
Warning: os-prober will be executed to detect other bootable partitions.
Its output will be used to detect bootable binaries on them and create
new boot entries.
Found Windows Recovery Environment on /dev/sdb3
done

# dpkg -l | grep linux-image | awk '/^(ii)/ {print $1 " " $2 " " $3}'
| column -t
ii  linux-image-6.1.0-1-amd64                   6.1.4-1
ii  linux-image-6.2.0-rc4-1-amd64-clang15-kcfi  6.2.0~rc4-1~unstable+dileks1
ii  linux-image-amd64

-Sedat-
