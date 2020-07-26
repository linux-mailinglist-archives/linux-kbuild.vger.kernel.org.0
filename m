Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E9022E169
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Jul 2020 18:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgGZQoL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Jul 2020 12:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGZQoL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jul 2020 12:44:11 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB1BC0619D2;
        Sun, 26 Jul 2020 09:44:11 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id h1so10574490otq.12;
        Sun, 26 Jul 2020 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=WG+IiSADj4bC8adDl2auSWlEfulYkcaFltfgstRWQ5Y=;
        b=FKU5MvfQ5K1ZlsKoTdFXi482971xJ8n8FjvZVjcIhM6gB+/8mytUpIch25b/fAE+oJ
         udwQB3URwVq3O+46c9le9KD3NUXxKDLTit/DxfbO5DCussKq3Rp2ulxLZMLMZ7MM9w1W
         J2G6OucCGO9Z5Mz5i8sHF4KGg/5Zg7/H336MHN9zbf026cUwuHv/aeOUgdwowd6+EC2F
         L+oOFGqYePeG3mJKcV2TDTTeatw03f+XqepZ8erGEtsmP4Hi1zIhWCuakDx16NJ8l4Bb
         0wMpBePLihDxP76vQHVuqtsdn48MVegp/CzteTtME9N0LSYx1Dm5NTr3iAFIhtok+CCJ
         g7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=WG+IiSADj4bC8adDl2auSWlEfulYkcaFltfgstRWQ5Y=;
        b=lgpxYpj8f2qRbqio/xpNZ/vhwFAGb+k3MuKzU2C3QgX7ArJQxehyOWNthv4XnD+6ML
         N3KcazJXPvLdUGgYjta9FS+9d2HCqr4YmM3cS/TwqF2PbIKlLfpDDMg1VCqvuQapTaCU
         KM3JraiAdUpYgmFFL/qcKD8n6d1psozD9FVB5GbA9fVRQ7Nqvb5y/gSu35CHEDxLOef+
         YrmZfasJhX5xsab4jwpDis5+J96eVa7GGBjSn60DRn9wM+F+y3q2BxsCsBSDxMhxp8IO
         dFGPBzyvidEorGKohmhEVLq8Fu+PxzY74BF5M2e1+35+orY8O6bjtw4NKalrJ5kqxdad
         aH6Q==
X-Gm-Message-State: AOAM533naQe+22lOKgVkjN9lCCqc0sP3okB3fSZxxUWHCxXiBSHqgI0q
        9iYZAKBpGea01JrK/SF24fcURYX+6smk3dWtl0vZwZOLycM=
X-Google-Smtp-Source: ABdhPJyyQVOCA2uLL/WHvGjv3VXAVUW2/bbulIVmhdj1GCluVtTMRr6LbYDKzvWjzI2hxvnEIa+zfcmP5xChsXib1nk=
X-Received: by 2002:a9d:2c29:: with SMTP id f38mr5654679otb.234.1595781850542;
 Sun, 26 Jul 2020 09:44:10 -0700 (PDT)
MIME-Version: 1.0
From:   Jan Ziak <0xe2.0x9a.0x9b@gmail.com>
Date:   Sun, 26 Jul 2020 18:43:34 +0200
Message-ID: <CAODFU0ogKh6iz_F9fOYwqChfWZ+VJXoBebzzMHiOtdTK_jXqqg@mail.gmail.com>
Subject: Re: Kernel compression benchmarks
To:     alex_y_xu@yahoo.ca
Cc:     Kernel-team@fb.com, clm@fb.com, gregkh@linuxfoundation.org,
        keescook@chromium.org, kilobyte@angband.pl,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@kernel.org, nickrterrell@gmail.com, nolange79@gmail.com,
        oss@malat.biz, patrick@stwcx.xyz, patrickw3@fb.com, rmikey@fb.com,
        sedat.dilek@gmail.com, terrelln@fb.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello

I looked at the SVG graphs and it appears that the formula used wasn't
T_load+T_decompress, but was just T_decompress.

Without considering the time it takes to load the compressed data from
a storage device, the SVG graphs are only half-done and might be
deceiving.

There are 3 kinds of typical device speeds nowadays, the sequential
read speed of a large non-fragmented compressed file is one of the
following:

100 MB/s: rotational disks and USB flash drives
500 MB/s: SATA SSD
2 GB/s: NVMe SSD

The read speeds of USB flash devices vary a lot, but in case of recent
high-speed USB flash drives it falls into the 100 MB/s category of
rotational disks. Taking USB flash read speed into consideration is
important for deciding which compression to use when creating the ISO
image of a Linux distribution.

In summary: Instead of the 1 kernel-decomp.svg file, there should be 3
kernel-read-decomp.svg files. Similarly in the case of the
initramfs-decomp.svg file.

As a rule of thumb, if the kernel and initramfs are stored on a NVMe
SSD then simply select the fastest decompressor without considering
the compression ratio - or avoid using any compression at all in which
case T_decompress will be zero.

The formula T_load+T_decompress assumes that loading and decompression
aren't executing in parallel. If they are, the formula should be
max(T_load, T_decompress).

Sincerely
Jan
