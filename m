Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB967434D32
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhJTOOh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhJTOOh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:14:37 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D97C7C06161C;
        Wed, 20 Oct 2021 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=ho8quJyvUf9mH96/2UjA8Jifq8y8+C3wTRl9JpKWzIY=; b=T7nP43FyT5WYf
        BY0Wj3cqnWTyiD7XhA2sr2t3vN2oouuyd5y8Wba4/rgJ+scoeFjBtMMVEqupY3Wz
        066MnCjM9bbQ2qklpaqW+B9atntbLHvx6RxlY7ktvWb0NL3JbotANi8Fqe1J0Vuy
        FEgLy7NV84yRpNPBRMbRqw1xBw85kQ=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygDn71u+I3BhHYdUAA--.36286S2;
        Wed, 20 Oct 2021 22:12:15 +0800 (CST)
Date:   Wed, 20 Oct 2021 22:05:29 +0800
From:   Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: switch to relative extable
Message-ID: <20211020220529.54ccf4e9@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygDn71u+I3BhHYdUAA--.36286S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyDXryDGry7Cr18urW8tFb_yoWDurX_ua
        4IvFy8W3yxXa1fAF9rJrn5JrW0krW8tryDJF45tr47KrZrCr4DKryqqF4xZw18ZF45XF4f
        GrZ7Xr48tr17tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbrAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
        JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6F
        yj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxUz_MaUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Jisheng Zhang <jszhang@kernel.org>

Similar as other architectures such as arm64, x86 and so on, use
offsets relative to the exception table entry values rather than
absolute addresses for both the exception locationand the fixup.

patch1 consolidates the __ex_table construction, it's a great code
clean up even w/o the 2nd patch.

patch2 does the real job.

Since v1:
  - fix build error for NOMMU case, thank lkp@intel.com

Jisheng Zhang (2):
  riscv: consolidate __ex_table construction
  riscv: switch to relative exception tables

 arch/riscv/include/asm/Kbuild    |  1 -
 arch/riscv/include/asm/extable.h | 25 ++++++++++++++++++++
 arch/riscv/include/asm/futex.h   | 12 +++-------
 arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
 arch/riscv/lib/uaccess.S         |  4 ++--
 arch/riscv/mm/extable.c          |  2 +-
 scripts/mod/modpost.c            | 27 +++++++++++++++++++++
 scripts/sorttable.c              |  2 +-
 8 files changed, 73 insertions(+), 40 deletions(-)
 create mode 100644 arch/riscv/include/asm/extable.h

-- 
2.33.0


