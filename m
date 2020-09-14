Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8260268C50
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 15:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgINNhh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 09:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgINNgI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 09:36:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E426C06174A;
        Mon, 14 Sep 2020 06:36:03 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e17so71526wme.0;
        Mon, 14 Sep 2020 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=gdhmugLqW7kZFrfvX3M00eU7dg8wTThNgVclxlTgViM=;
        b=e7fyEFcEndcJpteBlRD60kFt98Z69+lfT6bkXtZoa9qDJV0+gtG/vOmS/JdZXXtZiM
         F9dc885pna3iqyCzQqaMQ0H2voJeG90Oh3b+FjP9MNfPxmieGThCAB2Ztwt5kN5iF8U3
         LNbvu0RVEffgIJuCTQ7eyH+xWLrTnHVkaGAU2ihK9aqi0fyfwlqKLUePA6L90ERXWbU7
         9tXhjFJ1sqN2/+vsj+rSTkAvVM+gedJENBOloau/bjczRAz7ia158ClEjnkce+9K9Vp/
         3Pc4qd702VNQL9kwQo+COLOy4AdxVgo00MTgX3N9GUshFA55ZGnln3A9DhNKLhuosNVj
         p44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=gdhmugLqW7kZFrfvX3M00eU7dg8wTThNgVclxlTgViM=;
        b=ACGP96OCNvz3uQMWIvZa6sTBKwQ9TkSx5XtVLvODeLfeOQeyfWYZvCgpFlM2tDnie4
         zR7OLHcDKICMUrOyo/9vmlRHtk1ZJRcN48tq42Gkcw+HdOQ2vRz7F1829d60GVdDumnT
         Lg9SInZFw4GPTvYngtPiKFm/qhFk5J1HIlvfppwBGaXZPDVNcYep2n+5aWEdjW8iH7iv
         LPIO+toEHTH4Gg13CMhRvF/oXuot1F1K88OjFUFFGDIspSvd8l6yGKZKnwYKfBR52sCJ
         RNpb5lxOO4pDttFCnJC4lDr/uKqzaunkLQVLa3Kg8BVG0qmtDmtQHn1uytLz3r5doGCY
         5MJw==
X-Gm-Message-State: AOAM5300tB5bGtGJAbhDBIVuJAuo9+IZmnMX+sPimgDkHp1YSKSvp7MW
        GyRg2LEHylBZM1SDv2yEbQ==
X-Google-Smtp-Source: ABdhPJwKhNPs4paL/6g5fIc2dooU8YJ4hKIr6kqKv3iHeuW0Wc0X/Qgkl2E9ARAKZ5Xu5tIlNcpJDQ==
X-Received: by 2002:a1c:4c0d:: with SMTP id z13mr14408941wmf.113.1600090562397;
        Mon, 14 Sep 2020 06:36:02 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.238])
        by smtp.gmail.com with ESMTPSA id s67sm20034759wmf.38.2020.09.14.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:36:01 -0700 (PDT)
Date:   Mon, 14 Sep 2020 16:35:59 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     mingo@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        masahiroy@kernel.org
Subject: Re: [PATCH] kbuild: Run syncconfig with -s
Message-ID: <20200914133559.GA126210@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> BTW., there's another, rather spurious bug I recently triggered in kbuild.
> 
> Occasionally when I Ctrl-C a kernel build on a system with a lot of CPUs, 
> the .o.cmd file gets corrupted:

Those are temporary files, truncated at page boundary.

	$ stat -c %s XXX.pata_sil680.mod.o.cmd
	12288

I tried to fix this by inserting shell 'trap' directive but it failed
somewhere else.

	cmd_and_fixdep =                                                     \
        $(cmd);                                                              \
        scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
        rm -f $(depfile)
