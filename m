Return-Path: <linux-kbuild+bounces-11815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBfRKu3isGkuoAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11815-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 04:35:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABD25BA72
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 04:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21A573053B34
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 03:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77399371890;
	Wed, 11 Mar 2026 03:34:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5EE26B777;
	Wed, 11 Mar 2026 03:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773200098; cv=none; b=SiCo92Itt+miVvqSBMJf2Wk82t//Zm30xb/2hqn4ccdNTcWk8SeA1T+YP1s83cmT4gLX/B7zOkOTyiHhHyeyWaZfuI/oHZ2Kr0aO7sNBLLXbzqOay4t7u4YTRiIT9vaaMCcNdyx5jeC/mwf43odiyyKaEpOlzSjeL0nZHf927uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773200098; c=relaxed/simple;
	bh=GaqiIJVMnQ6NWxT7XKYZDglFtTNOHWf61pFujmouSM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWoyQC7lIdIgc3RXq1QvuB25+Bt2TY5kYt6ljXoFEGPzI4AUYb+bRJOhyuCZXXQAN95s4LeCD4P/DjSE7g+SfL9RM5CaYqDPuK+jVVZIitnqly2etg3jP8278SU1qdL5vjGz6YKGYOJ/arGiaCbQ7ZooUsWj6grCTH3Ksn35NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [10.213.22.86] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowABn027A4rBpdn+3CQ--.6054S2;
	Wed, 11 Mar 2026 11:34:24 +0800 (CST)
Message-ID: <e393e07f-368f-4b38-b2ed-937ddcc0a217@iscas.ac.cn>
Date: Wed, 11 Mar 2026 11:34:24 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
To: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil Babka
 <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-4-sashal@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260303182103.3523438-4-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qwCowABn027A4rBpdn+3CQ--.6054S2
X-Coremail-Antispam: 1UD129KBjvAXoWfXF4rCF17ZFWxGFWxtw1fWFg_yoW5GrWfAo
	Z3ua1UW3WxCry7CrW5AF18Jr9xuFWvyrsrArWYv3yUKF13XrWFkFZxK3W5XFs8ta1UKF9F
	k34Iqw13Ja10qw18n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYP7k0a2IF6w4kM7kC6x804xWl14x267AKxVW5JVWrJwAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYWGQDUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Rspamd-Queue-Id: 0CABD25BA72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.479];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11815-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Sasha,

I've been trying this out and AFAICT this does work perfectly.=C2=A0Thank=
 you
for this.

There are a few oddities I found:

Firstly I've been building with something like O=3D_riscv out of
convenience, and the file names have an extra ../ in the front. (This is
just me exiting out of init=3D/bin/sh.)

[    2.317268] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x00000000
[    2.320283] CPU: 0 UID: 0 PID: 1 Comm: sh Not tainted 7.0.0-rc3-00004-=
g8ad18f1a1a2f #31 PREEMPTLAZY=20
[    2.322048] Hardware name: riscv-virtio,qemu (DT)
[    2.323220] Call Trace:
[    2.324465] [<ffffffff800172a8>] dump_backtrace+0x1c/0x24 (../arch/ris=
cv/kernel/stacktrace.c:150)
[    2.329061] [<ffffffff8000241e>] show_stack+0x2a/0x34 (../arch/riscv/k=
ernel/stacktrace.c:156)
[    2.330334] [<ffffffff8000fe32>] dump_stack_lvl+0x4a/0x68 (../lib/dump=
_stack.c:122)
[    2.331462] [<ffffffff8000fe64>] dump_stack+0x14/0x1c (../lib/dump_sta=
ck.c:130)
[    2.332571] [<ffffffff80002a88>] vpanic+0x108/0x2bc (../kernel/panic.c=
:651)
[    2.333674] [<ffffffff80002c6e>] panic+0x32/0x34 (../kernel/panic.c:78=
7)
[    2.334427] [<ffffffff8002e97a>] do_exit+0x7ee/0x7f4 (../kernel/exit.c=
:930)
[    2.335194] [<ffffffff8002eade>] do_group_exit+0x1a/0x88 (../kernel/ex=
it.c:1099)
[    2.335945] [<ffffffff8002eb62>] __riscv_sys_exit_group+0x16/0x18 (../=
kernel/exit.c:1129)
[    2.336763] [<ffffffff80b3e868>] do_trap_ecall_u+0x260/0x45c (../arch/=
riscv/include/asm/syscall.h:112)
[    2.337765] [<ffffffff80b4c034>] handle_exception+0x168/0x174 (../arch=
/riscv/kernel/entry.S:233)

This is fine by me, but I've seen mentions of O=3D builds but I'm not sur=
e
if it's expected.

Also, toggling CONFIG_KALLSYMS_LINEINFO seems to rebuild every single
file. I haven't debugged why, but is this expected?

I have a few ideas about the code as well. Since this patch 3 touches
most of the files involved, I'll just dump my thoughts on the whole
series here. I want to note that I haven't read the RFC thread too
carefully, but I don't think there were many comments on the implementati=
on.

On 3/4/26 02:21, Sasha Levin wrote:
> Replace the flat uncompressed parallel arrays (lineinfo_addrs[],
> lineinfo_file_ids[], lineinfo_lines[]) with a block-indexed,
> delta-encoded, ULEB128 varint compressed format.
>
> The sorted address array has small deltas between consecutive entries
> (typically 1-50 bytes), file IDs have high locality (delta often 0,
> same file), and line numbers change slowly.  Delta-encoding followed
> by ULEB128 varint compression shrinks most values from 4 bytes to 1.
>
> Entries are grouped into blocks of 64.  A small uncompressed block
> index (first addr + byte offset per block) enables O(log(N/64)) binary
> search, followed by sequential decode of at most 64 varints within the
> matching block.  All decode state lives on the stack -- zero
> allocations, still safe for NMI/panic context.
>
> Measured on a defconfig+debug x86_64 build (3,017,154 entries, 4,822
> source files, 47,144 blocks):
>
>   Before (flat arrays):
>     lineinfo_addrs[]    12,068,616 bytes (u32 x 3.0M)
>     lineinfo_file_ids[]  6,034,308 bytes (u16 x 3.0M)
>     lineinfo_lines[]    12,068,616 bytes (u32 x 3.0M)
>     Total:              30,171,540 bytes (28.8 MiB, 10.0 bytes/entry)
>
>   After (block-indexed delta + ULEB128):
>     lineinfo_block_addrs[]    188,576 bytes (184 KiB)
>     lineinfo_block_offsets[]  188,576 bytes (184 KiB)
>     lineinfo_data[]        10,926,128 bytes (10.4 MiB)
>     Total:                 11,303,280 bytes (10.8 MiB, 3.7 bytes/entry)=

>
>   Savings: 18.0 MiB (2.7x reduction)
>
> Booted in QEMU and verified with SysRq-l that annotations still work:
>
>   default_idle+0x9/0x10 (arch/x86/kernel/process.c:767)
>   default_idle_call+0x6c/0xb0 (kernel/sched/idle.c:122)
>   do_idle+0x335/0x490 (kernel/sched/idle.c:191)
>   cpu_startup_entry+0x4e/0x60 (kernel/sched/idle.c:429)
>   rest_init+0x1aa/0x1b0 (init/main.c:760)
>
> Suggested-by: Juergen Gross <jgross@suse.com>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  .../admin-guide/kallsyms-lineinfo.rst         |   7 +-
>  include/linux/mod_lineinfo.h                  | 103 ++++++++--
>  init/Kconfig                                  |   8 +-
>  kernel/kallsyms.c                             |  91 +++++++--
>  kernel/kallsyms_internal.h                    |   7 +-
>  kernel/module/kallsyms.c                      | 107 +++++++---
>  scripts/gen_lineinfo.c                        | 192 ++++++++++++++----=

>  scripts/kallsyms.c                            |   7 +-
>  scripts/link-vmlinux.sh                       |  16 +-
>  9 files changed, 423 insertions(+), 115 deletions(-)
>
> diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Document=
ation/admin-guide/kallsyms-lineinfo.rst
> index 21450569d5324..fe92c5dde16b3 100644
> --- a/Documentation/admin-guide/kallsyms-lineinfo.rst
> +++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
> @@ -76,10 +76,11 @@ Memory Overhead
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  The vmlinux lineinfo tables are stored in ``.rodata`` and typically ad=
d
> -approximately 44 MiB to the kernel image for a standard configuration
> -(~4.6 million DWARF line entries, ~10 bytes per entry after deduplicat=
ion).
> +approximately 10-15 MiB to the kernel image for a standard configurati=
on
> +(~4.6 million DWARF line entries, ~2-3 bytes per entry after delta
> +compression).
> =20
> -Per-module lineinfo adds approximately 10 bytes per DWARF line entry t=
o each
> +Per-module lineinfo adds approximately 2-3 bytes per DWARF line entry =
to each
>  ``.ko`` file.
> =20

Maybe this could be given in terms of percentages? It wasn't obvious to
me what 10-15 MiB amounts to.

On riscv64, I'm seeing a 24.2 MiB to 30.2 MiB increase in
arch/riscv/boot/Image size on an approximately defconfig+mod2noconfig
build, which is about a 25% increase. I haven't checked yet, but if 25%
is similar to what other archs get, that's a more useful figure than
10-15 MiB, given that the size increase is correlated to the total
amount of code linked into the kernel/module.

>  Known Limitations
> diff --git a/include/linux/mod_lineinfo.h b/include/linux/mod_lineinfo.=
h
> index d62e9608f0f82..ab758acfadceb 100644
> --- a/include/linux/mod_lineinfo.h
> +++ b/include/linux/mod_lineinfo.h
> @@ -8,13 +8,19 @@
>   *
>   * Section layout (all values in target-native endianness):
>   *
> - *   struct mod_lineinfo_header     (16 bytes)
> - *   u32 addrs[num_entries]         -- offsets from .text base, sorted=

> - *   u16 file_ids[num_entries]      -- parallel to addrs
> - *   <2-byte pad if num_entries is odd>
> - *   u32 lines[num_entries]         -- parallel to addrs
> + *   struct mod_lineinfo_header     (24 bytes)
> + *   u32 block_addrs[num_blocks]    -- first addr per block, for binar=
y search
> + *   u32 block_offsets[num_blocks]  -- byte offset into compressed dat=
a stream
> + *   u8  data[data_size]            -- ULEB128 delta-compressed entrie=
s
>   *   u32 file_offsets[num_files]    -- byte offset into filenames[]
>   *   char filenames[filenames_size] -- concatenated NUL-terminated str=
ings
> + *
> + * Compressed stream format (per block of LINEINFO_BLOCK_ENTRIES entri=
es):
> + *   Entry 0: file_id (ULEB128), line (ULEB128)
> + *            addr is in block_addrs[]
> + *   Entry 1..N: addr_delta (ULEB128),
> + *               file_id_delta (zigzag-encoded ULEB128),
> + *               line_delta (zigzag-encoded ULEB128)
>   */
>  #ifndef _LINUX_MOD_LINEINFO_H
>  #define _LINUX_MOD_LINEINFO_H
> @@ -25,44 +31,107 @@
>  #include <stdint.h>
>  typedef uint32_t u32;
>  typedef uint16_t u16;
> +typedef uint8_t  u8;
>  #endif
> =20
> +#define LINEINFO_BLOCK_ENTRIES 64
> +
>  struct mod_lineinfo_header {
>  	u32 num_entries;
>  	u32 num_files;
>  	u32 filenames_size;	/* total bytes of concatenated filenames */
> +	u32 num_blocks;
> +	u32 data_size;		/* total bytes of compressed data stream */
>  	u32 reserved;		/* padding, must be 0 */
>  };
> =20
>  /* Offset helpers: compute byte offset from start of section to each a=
rray */
> =20
> -static inline u32 mod_lineinfo_addrs_off(void)
> +static inline u32 mod_lineinfo_block_addrs_off(void)
>  {
>  	return sizeof(struct mod_lineinfo_header);
>  }
> =20
> -static inline u32 mod_lineinfo_file_ids_off(u32 num_entries)
> +static inline u32 mod_lineinfo_block_offsets_off(u32 num_blocks)
>  {
> -	return mod_lineinfo_addrs_off() + num_entries * sizeof(u32);
> +	return mod_lineinfo_block_addrs_off() + num_blocks * sizeof(u32);
>  }
> =20
> -static inline u32 mod_lineinfo_lines_off(u32 num_entries)
> +static inline u32 mod_lineinfo_data_off(u32 num_blocks)
>  {
> -	/* u16 file_ids[] may need 2-byte padding to align lines[] to 4 bytes=
 */
> -	u32 off =3D mod_lineinfo_file_ids_off(num_entries) +
> -		  num_entries * sizeof(u16);
> -	return (off + 3) & ~3u;
> +	return mod_lineinfo_block_offsets_off(num_blocks) +
> +	       num_blocks * sizeof(u32);
>  }
> =20
> -static inline u32 mod_lineinfo_file_offsets_off(u32 num_entries)
> +static inline u32 mod_lineinfo_file_offsets_off(u32 num_blocks, u32 da=
ta_size)
>  {
> -	return mod_lineinfo_lines_off(num_entries) + num_entries * sizeof(u32=
);
> +	return mod_lineinfo_data_off(num_blocks) + data_size;
>  }
> =20
> -static inline u32 mod_lineinfo_filenames_off(u32 num_entries, u32 num_=
files)
> +static inline u32 mod_lineinfo_filenames_off(u32 num_blocks, u32 data_=
size,
> +					     u32 num_files)
>  {
> -	return mod_lineinfo_file_offsets_off(num_entries) +
> +	return mod_lineinfo_file_offsets_off(num_blocks, data_size) +
>  	       num_files * sizeof(u32);
>  }
> =20

I wonder if these headers could use a slightly simpler representation,
with each part represented with its offset from header start and total
size in bytes, a bit like flattened devicetrees. So like, blocks_offset,
blocks_size, files_offset, files_size...

This would make the assembly generation below more readable, and IMO
make understanding offset and array bound calculations way simpler, at
the cost of a few extra words in the header.

(Re: array bounds, I know there are easier ways to break the kernel
intentionally if you're writing kernel code. but these things that run
in the "ouch something bad happened" cases really should be a bit more
defensive against possibly bad data, esp. in dealing with loadable
modules. I haven't looked closely to the in-kernel lookup code, but I
don't see much sanity checks against lineinfo data? I *think* for
badly-sorted binary search just spits out a nonsensical offset, but I
really don't want to find out what happens to the whole
binary-then-linear search code with negative sizes or out-of-bounds
offsets or something like that.)

> +/* Zigzag encoding: map signed to unsigned so small magnitudes are sma=
ll */
> +static inline u32 zigzag_encode(int32_t v)
> +{
> +	return ((u32)v << 1) ^ (u32)(v >> 31);
> +}
> +
> +static inline int32_t zigzag_decode(u32 v)
> +{
> +	return (int32_t)((v >> 1) ^ -(v & 1));
> +}
> +
> +/*
> + * Read a ULEB128 varint from a byte stream.
> + * Returns the decoded value and advances *pos past the encoded bytes.=

> + * If *pos would exceed 'end', returns 0 and sets *pos =3D end (safe f=
or
> + * NMI/panic context -- no crash, just a missed annotation).

What does that last bit mean...?

> + */
> +static inline u32 lineinfo_read_uleb128(const u8 *data, u32 *pos, u32 =
end)
> +{
> +	u32 result =3D 0;
> +	unsigned int shift =3D 0;
> +
> +	while (*pos < end) {
> +		u8 byte =3D data[*pos];
> +		(*pos)++;
> +		result |=3D (u32)(byte & 0x7f) << shift;
> +		if (!(byte & 0x80))
> +			return result;
> +		shift +=3D 7;
> +		if (shift >=3D 32) {
> +			/* Malformed -- skip remaining continuation bytes */
> +			while (*pos < end && (data[*pos] & 0x80))
> +				(*pos)++;
> +			if (*pos < end)
> +				(*pos)++;
> +			return result;
> +		}
> +	}
> +	return result;
> +}
> +
> +/* Write a ULEB128 varint -- build tool only */
> +#ifndef __KERNEL__
> +static inline unsigned int lineinfo_write_uleb128(u8 *buf, u32 value)
> +{
> +	unsigned int len =3D 0;
> +
> +	do {
> +		u8 byte =3D value & 0x7f;
> +
> +		value >>=3D 7;
> +		if (value)
> +			byte |=3D 0x80;
> +		buf[len++] =3D byte;
> +	} while (value);
> +	return len;
> +}
> +#endif /* !__KERNEL__ */
> +
>  #endif /* _LINUX_MOD_LINEINFO_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index bf53275bc405a..6e3795b3dbd62 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2065,8 +2065,9 @@ config KALLSYMS_LINEINFO
>  	    anon_vma_clone+0x2ed/0xcf0 (mm/rmap.c:412)
> =20
>  	  This requires elfutils (libdw-dev/elfutils-devel) on the build host=
=2E
> -	  Adds approximately 44MB to a typical kernel image (10 bytes per
> -	  DWARF line-table entry, ~4.6M entries for a typical config).
> +	  Adds approximately 10-15MB to a typical kernel image (~2-3 bytes
> +	  per entry after delta compression, ~4.6M entries for a typical
> +	  config).
> =20
>  	  If unsure, say N.
> =20
> @@ -2079,7 +2080,8 @@ config KALLSYMS_LINEINFO_MODULES
>  	  so stack traces from module code include (file.c:123) annotations.
> =20
>  	  Requires elfutils (libdw-dev/elfutils-devel) on the build host.
> -	  Increases .ko sizes by approximately 10 bytes per DWARF line entry.=

> +	  Increases .ko sizes by approximately 2-3 bytes per DWARF line
> +	  entry after delta compression.
> =20
>  	  If unsure, say N.
> =20

(Same as above, maybe use percentages when talking about sizes?)

> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index cea74992e5427..de4aa8fcfd69d 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -468,14 +468,20 @@ static int append_buildid(char *buffer,   const c=
har *modname,
>  #endif /* CONFIG_STACKTRACE_BUILD_ID */
> =20
>  #ifdef CONFIG_KALLSYMS_LINEINFO
> +#include <linux/mod_lineinfo.h>
> +
>  bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_st=
art,
>  			      const char **file, unsigned int *line)
>  {

[...]

> diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
> index 868a1d5035212..691be44440395 100644
> --- a/kernel/kallsyms_internal.h
> +++ b/kernel/kallsyms_internal.h
> @@ -17,10 +17,11 @@ extern const u8 kallsyms_seqs_of_names[];
> =20
>  #ifdef CONFIG_KALLSYMS_LINEINFO
>  extern const u32 lineinfo_num_entries;
> -extern const u32 lineinfo_addrs[];
> -extern const u16 lineinfo_file_ids[];
> -extern const u32 lineinfo_lines[];
>  extern const u32 lineinfo_num_files;
> +extern const u32 lineinfo_num_blocks;
> +extern const u32 lineinfo_block_addrs[];
> +extern const u32 lineinfo_block_offsets[];
> +extern const u8  lineinfo_data[];
>  extern const u32 lineinfo_file_offsets[];
>  extern const char lineinfo_filenames[];
>  #endif
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index 7af414bd65e79..0ead1bb69de4e 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -512,15 +512,19 @@ bool module_lookup_lineinfo(struct module *mod, u=
nsigned long addr,
>  {

This and kallsyms_lookup_lineinfo() above look like almost exactly the
same code twice. Some refactoring would be nice, just so that others
don't have to read the same code twice, or worse, change the same code
twice later on.

[...]

> diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
> index 609de59f47ffd..9507ed9bcbe55 100644
> --- a/scripts/gen_lineinfo.c
> +++ b/scripts/gen_lineinfo.c
> @@ -8,6 +8,9 @@
>   * file containing sorted lookup tables that the kernel uses to annota=
te
>   * stack traces with source file:line information.
>   *
> + * The output uses a block-indexed, delta-encoded, ULEB128-compressed =
format
> + * for ~3-4x size reduction compared to flat arrays.
> + *
>   * Requires libdw from elfutils.
>   */
> =20
> @@ -53,6 +56,15 @@ static struct file_entry *files;
>  static unsigned int num_files;
>  static unsigned int files_capacity;
> =20
> +/* Compressed output */
> +static unsigned char *compressed_data;
> +static unsigned int compressed_size;
> +static unsigned int compressed_capacity;
> +
> +static unsigned int *block_addrs;
> +static unsigned int *block_offsets;
> +static unsigned int num_blocks;
> +
>  #define FILE_HASH_BITS 13
>  #define FILE_HASH_SIZE (1 << FILE_HASH_BITS)
> =20
> @@ -352,6 +364,93 @@ static void deduplicate(void)
>  	num_entries =3D j + 1;
>  }
> =20
> +static void compressed_ensure(unsigned int need)
> +{
> +	if (compressed_size + need <=3D compressed_capacity)
> +		return;
> +	compressed_capacity =3D compressed_capacity ? compressed_capacity * 2=
 : 1024 * 1024;
> +	while (compressed_capacity < compressed_size + need)
> +		compressed_capacity *=3D 2;
> +	compressed_data =3D realloc(compressed_data, compressed_capacity);
> +	if (!compressed_data) {
> +		fprintf(stderr, "out of memory\n");
> +		exit(1);
> +	}
> +}
> +
> +static void compress_entries(void)
> +{
> +	unsigned int i, block;
> +
> +	if (num_entries =3D=3D 0) {
> +		num_blocks =3D 0;
> +		return;
> +	}
> +
> +	num_blocks =3D (num_entries + LINEINFO_BLOCK_ENTRIES - 1) / LINEINFO_=
BLOCK_ENTRIES;
> +	block_addrs =3D calloc(num_blocks, sizeof(*block_addrs));
> +	block_offsets =3D calloc(num_blocks, sizeof(*block_offsets));
> +	if (!block_addrs || !block_offsets) {
> +		fprintf(stderr, "out of memory\n");
> +		exit(1);
> +	}
> +
> +	for (block =3D 0; block < num_blocks; block++) {
> +		unsigned int base =3D block * LINEINFO_BLOCK_ENTRIES;
> +		unsigned int count =3D num_entries - base;
> +		unsigned int prev_addr, prev_file_id, prev_line;
> +		unsigned char buf[10]; /* max 5 bytes per ULEB128 */
> +
> +		if (count > LINEINFO_BLOCK_ENTRIES)
> +			count =3D LINEINFO_BLOCK_ENTRIES;
> +
> +		block_addrs[block] =3D entries[base].offset;
> +		block_offsets[block] =3D compressed_size;
> +
> +		/* Entry 0: file_id (ULEB128), line (ULEB128) */
> +		compressed_ensure(20);
> +		compressed_size +=3D lineinfo_write_uleb128(
> +			compressed_data + compressed_size,
> +			entries[base].file_id);
> +		compressed_size +=3D lineinfo_write_uleb128(
> +			compressed_data + compressed_size,
> +			entries[base].line);
> +
> +		prev_addr =3D entries[base].offset;
> +		prev_file_id =3D entries[base].file_id;
> +		prev_line =3D entries[base].line;
> +
> +		/* Entries 1..N: deltas */
> +		for (i =3D 1; i < count; i++) {
> +			unsigned int idx =3D base + i;
> +			unsigned int addr_delta;
> +			int32_t file_delta, line_delta;
> +			unsigned int n;
> +
> +			addr_delta =3D entries[idx].offset - prev_addr;
> +			file_delta =3D (int32_t)entries[idx].file_id - (int32_t)prev_file_i=
d;
> +			line_delta =3D (int32_t)entries[idx].line - (int32_t)prev_line;
> +
> +			compressed_ensure(15);
> +			n =3D lineinfo_write_uleb128(buf, addr_delta);
> +			memcpy(compressed_data + compressed_size, buf, n);
> +			compressed_size +=3D n;
> +
> +			n =3D lineinfo_write_uleb128(buf, zigzag_encode(file_delta));
> +			memcpy(compressed_data + compressed_size, buf, n);
> +			compressed_size +=3D n;
> +
> +			n =3D lineinfo_write_uleb128(buf, zigzag_encode(line_delta));
> +			memcpy(compressed_data + compressed_size, buf, n);
> +			compressed_size +=3D n;
> +
> +			prev_addr =3D entries[idx].offset;
> +			prev_file_id =3D entries[idx].file_id;
> +			prev_line =3D entries[idx].line;
> +		}
> +	}
> +}
> +
>  static void compute_file_offsets(void)
>  {
>  	unsigned int offset =3D 0;
> @@ -395,28 +494,40 @@ static void output_assembly(void)
>  	printf("lineinfo_num_files:\n");
>  	printf("\t.long %u\n\n", num_files);
> =20
> -	/* Sorted address offsets from _text */
> -	printf("\t.globl lineinfo_addrs\n");
> +	/* Number of blocks */
> +	printf("\t.globl lineinfo_num_blocks\n");
>  	printf("\t.balign 4\n");
> -	printf("lineinfo_addrs:\n");
> -	for (unsigned int i =3D 0; i < num_entries; i++)
> -		printf("\t.long 0x%x\n", entries[i].offset);
> -	printf("\n");
> +	printf("lineinfo_num_blocks:\n");
> +	printf("\t.long %u\n\n", num_blocks);
> =20
> -	/* File IDs, parallel to addrs (u16 -- supports up to 65535 files) */=

> -	printf("\t.globl lineinfo_file_ids\n");
> -	printf("\t.balign 2\n");
> -	printf("lineinfo_file_ids:\n");
> -	for (unsigned int i =3D 0; i < num_entries; i++)
> -		printf("\t.short %u\n", entries[i].file_id);
> +	/* Block first-addresses for binary search */
> +	printf("\t.globl lineinfo_block_addrs\n");
> +	printf("\t.balign 4\n");
> +	printf("lineinfo_block_addrs:\n");
> +	for (unsigned int i =3D 0; i < num_blocks; i++)
> +		printf("\t.long 0x%x\n", block_addrs[i]);
>  	printf("\n");
> =20
> -	/* Line numbers, parallel to addrs */
> -	printf("\t.globl lineinfo_lines\n");
> +	/* Block byte offsets into compressed stream */
> +	printf("\t.globl lineinfo_block_offsets\n");
>  	printf("\t.balign 4\n");
> -	printf("lineinfo_lines:\n");
> -	for (unsigned int i =3D 0; i < num_entries; i++)
> -		printf("\t.long %u\n", entries[i].line);
> +	printf("lineinfo_block_offsets:\n");
> +	for (unsigned int i =3D 0; i < num_blocks; i++)
> +		printf("\t.long %u\n", block_offsets[i]);
> +	printf("\n");
> +
> +	/* Compressed data stream */
> +	printf("\t.globl lineinfo_data\n");
> +	printf("lineinfo_data:\n");
> +	for (unsigned int i =3D 0; i < compressed_size; i++) {
> +		if ((i % 16) =3D=3D 0)
> +			printf("\t.byte ");
> +		else
> +			printf(",");
> +		printf("0x%02x", compressed_data[i]);
> +		if ((i % 16) =3D=3D 15 || i =3D=3D compressed_size - 1)
> +			printf("\n");
> +	}
>  	printf("\n");
> =20

Note how compute_file_offsets() gives symbol names to the data it
generates. Meanwhile...

>  	/* File string offset table */
> @@ -450,33 +561,38 @@ static void output_module_assembly(void)
> =20
>  	printf("\t.section .mod_lineinfo, \"a\"\n\n");
> =20
> -	/* Header: num_entries, num_files, filenames_size, reserved */
> +	/* Header: num_entries, num_files, filenames_size, num_blocks, data_s=
ize, reserved */
>  	printf("\t.balign 4\n");
>  	printf("\t.long %u\n", num_entries);
>  	printf("\t.long %u\n", num_files);
>  	printf("\t.long %u\n", filenames_size);
> +	printf("\t.long %u\n", num_blocks);
> +	printf("\t.long %u\n", compressed_size);
>  	printf("\t.long 0\n\n");
> =20
> -	/* addrs[] */
> -	for (unsigned int i =3D 0; i < num_entries; i++)
> -		printf("\t.long 0x%x\n", entries[i].offset);
> -	if (num_entries)
> +	/* block_addrs[] */
> +	for (unsigned int i =3D 0; i < num_blocks; i++)
> +		printf("\t.long 0x%x\n", block_addrs[i]);
> +	if (num_blocks)
>  		printf("\n");
> =20
For the modules, it's comments in the C code that doesn't end up in the
assembly.

I'm thinking we could have something like:

	printf(".Lmod_lineinfo_block_addrs:\n")
	for (unsigned int i =3D 0; i < num_entries; i++)
		printf("\t.long 0x%x\n", ...);
	printf("\n")

(And similarly for the other blocks of data.)

This would make the assembly a tiny bit more readable, get rid of the
kinda ugly printf("\n") checks and prints, and would be useful for the
offset + size header format I mentioned earlier.

> -	/* file_ids[] */
> -	for (unsigned int i =3D 0; i < num_entries; i++)
> -		printf("\t.short %u\n", entries[i].file_id);
> -
> -	/* Padding to align lines[] to 4 bytes */
> -	if (num_entries & 1)
> -		printf("\t.short 0\n");
> -	if (num_entries)
> +	/* block_offsets[] */
> +	for (unsigned int i =3D 0; i < num_blocks; i++)
> +		printf("\t.long %u\n", block_offsets[i]);
> +	if (num_blocks)
>  		printf("\n");
> =20
> -	/* lines[] */
> -	for (unsigned int i =3D 0; i < num_entries; i++)
> -		printf("\t.long %u\n", entries[i].line);
> -	if (num_entries)
> +	/* compressed data[] */
> +	for (unsigned int i =3D 0; i < compressed_size; i++) {
> +		if ((i % 16) =3D=3D 0)
> +			printf("\t.byte ");
> +		else
> +			printf(",");
> +		printf("0x%02x", compressed_data[i]);
> +		if ((i % 16) =3D=3D 15 || i =3D=3D compressed_size - 1)
> +			printf("\n");
> +	}
> +	if (compressed_size)
>  		printf("\n");
> =20

Also, maybe we can use .uleb128/.sleb128 here, and generate something lik=
e:

	printf("\t.sleb128 %#x - %#x\n", cur_addr, prev_addr);=20

And have the assembler do the subtraction and encoding for us? If that
works it should significantly simplify the compression code above.

Speaking of... Why do we use uleb128(zigzag(num)) and not just sleb128(nu=
m)?

[...]

> @@ -558,10 +674,11 @@ int main(int argc, char *argv[])
>  			skipped_overflow);
> =20
>  	deduplicate();
> +	compress_entries();
>  	compute_file_offsets();
> =20
> -	fprintf(stderr, "lineinfo: %u entries, %u files\n",
> -		num_entries, num_files);
> +	fprintf(stderr, "lineinfo: %u entries, %u files, %u blocks, %u compre=
ssed bytes\n",
> +		num_entries, num_files, num_blocks, compressed_size);
> =20
>  	if (module_mode)
>  		output_module_assembly();
> @@ -577,6 +694,9 @@ int main(int argc, char *argv[])
>  	for (unsigned int i =3D 0; i < num_files; i++)
>  		free(files[i].name);
>  	free(files);
> +	free(compressed_data);
> +	free(block_addrs);
> +	free(block_offsets);
> =20
>  	return 0;
>  }
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 42662c4fbc6c9..94fbdad3df7c6 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -80,11 +80,12 @@ static bool is_ignored_symbol(const char *name, cha=
r type)
>  {
>  	/* Ignore lineinfo symbols for kallsyms pass stability */
>  	static const char * const lineinfo_syms[] =3D {
> -		"lineinfo_addrs",
> -		"lineinfo_file_ids",
> +		"lineinfo_block_addrs",
> +		"lineinfo_block_offsets",
> +		"lineinfo_data",
>  		"lineinfo_file_offsets",
>  		"lineinfo_filenames",
> -		"lineinfo_lines",
> +		"lineinfo_num_blocks",
>  		"lineinfo_num_entries",
>  		"lineinfo_num_files",
>  	};
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 640209f2e9eb9..3c122cf9b95c5 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -235,12 +235,16 @@ lineinfo_num_entries:
>  	.balign 4
>  lineinfo_num_files:
>  	.long 0
> -	.globl lineinfo_addrs
> -lineinfo_addrs:
> -	.globl lineinfo_file_ids
> -lineinfo_file_ids:
> -	.globl lineinfo_lines
> -lineinfo_lines:
> +	.globl lineinfo_num_blocks
> +	.balign 4
> +lineinfo_num_blocks:
> +	.long 0
> +	.globl lineinfo_block_addrs
> +lineinfo_block_addrs:
> +	.globl lineinfo_block_offsets
> +lineinfo_block_offsets:
> +	.globl lineinfo_data
> +lineinfo_data:
>  	.globl lineinfo_file_offsets
>  lineinfo_file_offsets:
>  	.globl lineinfo_filenames

The contents of this .tmp_lineinfo.S is fixed, so it feels like it could
just be a proper file, instead of something "generated" dynamically.

Thanks,
Vivian "dramforever" Wang


