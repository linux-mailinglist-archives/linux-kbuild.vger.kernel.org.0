Return-Path: <linux-kbuild+bounces-8566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FB1B32B66
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Aug 2025 19:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3405C1BC6E96
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Aug 2025 17:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163FC225A59;
	Sat, 23 Aug 2025 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxeoWd6/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475B3213E89;
	Sat, 23 Aug 2025 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755971724; cv=none; b=ua4A65nErU8qGOqN/yB/riBMVq9so3Rpu+EAyKqqIOtbNYwHeTxTO66nkA8BRcgqfW4sxtu0y4BAMiLG0gTE4OpsyEPY3mHVhacShWTMEYQiDy1z6gfiwkf4YdpUrBa3irgZu4/X9qHeYmcCzv4VnXZjs1myC2+iHfviC27ksSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755971724; c=relaxed/simple;
	bh=fBJPHujQaTfeJ/QhlahQ1Q7Dchv0xfwiZ8tXvM4XPX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ovaL2+bTpBFBwIlg8D1YORN+E6GZdHkLy+mRqMVdAGU80llnBUKtEhHIS4iln3KN7XMOoCPt+noDRY7s62X4onmCfvt7LJQjTMJfWemC6brlbKmlFzfLyle/eCeH6ZCjxpcKjCf3g1YD/c72bmVmqfyJ7KfNp2DY1eSFWkMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxeoWd6/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755971722; x=1787507722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fBJPHujQaTfeJ/QhlahQ1Q7Dchv0xfwiZ8tXvM4XPX0=;
  b=QxeoWd6/3MHXFG4x8t/RwE2HhgGuDNUvIH5Hg7neBdYyYeuJy8AuDJ+K
   n2Adq7APdT3vKqQtslwE9Hc34B9hIceq4iQyU8pFS3sAWGH8riGMGsWbT
   U4323NG+TUW0KxM1Ergsx7yLBkRmzDWn5slHC4QANCtsaLRZNGPZzpVk2
   7QQDmnXzvjaFUNuuH9a4kN2tHk6RWujgnOoogpOx5HRc7NV0vX1gRvCfJ
   g9GE1DSig9zS5leA08NEAK575Zf6MmsxXVwbNMKoqCHiF9eObouHSnvgv
   x0XNDjhC6uChfzL7bo7PaNZOTE3++wOdsB/RHpDc5NLrcxCRr5tiPRauM
   w==;
X-CSE-ConnectionGUID: TAotLZoLSse9abtFWkBieg==
X-CSE-MsgGUID: QM4k7DnHSMuKbzVoC/cORw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75699940"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75699940"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 10:55:21 -0700
X-CSE-ConnectionGUID: aWklkkZATGyZegBWr3QXJg==
X-CSE-MsgGUID: 4XPQOh4hSRmImI3tNEsAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174247581"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Aug 2025 10:55:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upsSQ-000MUB-0W;
	Sat, 23 Aug 2025 17:55:14 +0000
Date: Sun, 24 Aug 2025 01:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v6 2/3] tracing: Add a tracepoint verification check at
 build time
Message-ID: <202508240152.kQo4DBMl-lkp@intel.com>
References: <20250820174828.080947631@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820174828.080947631@kernel.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/sorttable-Move-ELF-parsing-into-scripts-elf-parse-ch/20250821-015048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250820174828.080947631%40kernel.org
patch subject: [PATCH v6 2/3] tracing: Add a tracepoint verification check at build time
config: x86_64-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240152.kQo4DBMl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240152.kQo4DBMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240152.kQo4DBMl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: tracepoint 'nfsd_cb_setup_err' is unused.
   warning: tracepoint 'nfsd_cb_setup' is unused.
   warning: tracepoint 'nfsd_cb_rpc_release' is unused.
   warning: tracepoint 'nfsd_cb_rpc_done' is unused.
   warning: tracepoint 'nfsd_cb_rpc_prepare' is unused.
   warning: tracepoint 'nfsd_cb_shutdown' is unused.
   warning: tracepoint 'nfsd_cb_lost' is unused.
   warning: tracepoint 'nfsd_cb_probe' is unused.
   warning: tracepoint 'nfsd_cb_new_state' is unused.
   warning: tracepoint 'nfsd_cb_start' is unused.
   warning: tracepoint 'nfsd_cb_nodelegs' is unused.
   warning: tracepoint 'nfsd_cb_args' is unused.
   warning: tracepoint 'nfsd_clid_confirmed_r' is unused.
   warning: tracepoint 'nfsd_clid_fresh' is unused.
   warning: tracepoint 'nfsd_clid_verf_mismatch' is unused.
   warning: tracepoint 'nfsd_clid_cred_mismatch' is unused.
   warning: tracepoint 'nfsd_grace_complete' is unused.
   warning: tracepoint 'nfsd_grace_start' is unused.
   warning: tracepoint 'nfsd_mark_client_expired' is unused.
   warning: tracepoint 'nfsd_clid_stale' is unused.
   warning: tracepoint 'nfsd_clid_renew' is unused.
   warning: tracepoint 'nfsd_clid_purged' is unused.
   warning: tracepoint 'nfsd_clid_replaced' is unused.
   warning: tracepoint 'nfsd_clid_admin_expired' is unused.
   warning: tracepoint 'nfsd_clid_destroyed' is unused.
   warning: tracepoint 'nfsd_clid_confirmed' is unused.
   warning: tracepoint 'nfsd_clid_reclaim_complete' is unused.
   warning: tracepoint 'nfsd_clid_expire_unconf' is unused.
   warning: tracepoint 'nfsd_slot_seqid_sequence' is unused.
   warning: tracepoint 'nfsd_slot_seqid_unconf' is unused.
   warning: tracepoint 'nfsd_slot_seqid_conf' is unused.
   warning: tracepoint 'nfsd_seq4_status' is unused.
   warning: tracepoint 'nfsd_stateowner_replay' is unused.
   warning: tracepoint 'nfsd_stid_revoke' is unused.
   warning: tracepoint 'nfsd_open_confirm' is unused.
   warning: tracepoint 'nfsd_preprocess' is unused.
   warning: tracepoint 'nfsd_deleg_return' is unused.
   warning: tracepoint 'nfsd_deleg_write' is unused.
   warning: tracepoint 'nfsd_deleg_read' is unused.
   warning: tracepoint 'nfsd_open' is unused.
   warning: tracepoint 'nfsd_layout_recall_release' is unused.
   warning: tracepoint 'nfsd_layout_recall_fail' is unused.
   warning: tracepoint 'nfsd_layout_recall_done' is unused.
   warning: tracepoint 'nfsd_layout_recall' is unused.
   warning: tracepoint 'nfsd_layout_return_lookup_fail' is unused.
   warning: tracepoint 'nfsd_layout_commit_lookup_fail' is unused.
   warning: tracepoint 'nfsd_layout_get_lookup_fail' is unused.
   warning: tracepoint 'nfsd_layoutstate_free' is unused.
   warning: tracepoint 'nfsd_layoutstate_unhash' is unused.
   warning: tracepoint 'nfsd_layoutstate_alloc' is unused.
   warning: tracepoint 'nfsd_delegret_wakeup' is unused.
   warning: tracepoint 'nfsd_clone_file_range_err' is unused.
   warning: tracepoint 'nfsd_compound_encode_err' is unused.
   warning: tracepoint 'nfsd_compound_op_err' is unused.
   warning: tracepoint 'nfsd_compound_decode_err' is unused.
   warning: tracepoint 'nfsd_compound_status' is unused.
   warning: tracepoint 'nfsd_compound' is unused.
   warning: tracepoint 'xfs_metadir_link' is unused.
   warning: tracepoint 'xfs_metadir_start_link' is unused.
   warning: tracepoint 'xfs_file_dax_write' is unused.
   warning: tracepoint 'xfs_file_dax_read' is unused.
   warning: tracepoint 'xrep_done' is unused.
   warning: tracepoint 'xrep_attempt' is unused.
   warning: tracepoint 'cachefiles_ondemand_fd_release' is unused.
   warning: tracepoint 'cachefiles_ondemand_fd_write' is unused.
   warning: tracepoint 'cachefiles_ondemand_cread' is unused.
   warning: tracepoint 'cachefiles_ondemand_read' is unused.
   warning: tracepoint 'cachefiles_ondemand_close' is unused.
   warning: tracepoint 'cachefiles_ondemand_copen' is unused.
   warning: tracepoint 'cachefiles_ondemand_open' is unused.
   warning: tracepoint 'ocfs2_encode_fh_begin' is unused.
   warning: tracepoint 'ocfs2_duplicate_clusters_by_jbd' is unused.
   warning: tracepoint 'zonefs_file_dio_append' is unused.
   warning: tracepoint 'edma_readb' is unused.
   warning: tracepoint 'edma_readw' is unused.
   warning: tracepoint 'xe_exec_queue_supress_resume' is unused.
   warning: tracepoint 'xe_vm_restart' is unused.
   warning: tracepoint 'xe_vma_userptr_rebind_exec' is unused.
   warning: tracepoint 'xe_vma_userptr_rebind_worker' is unused.
   warning: tracepoint 'xe_vma_flush' is unused.
   warning: tracepoint 'dma_fence_emit' is unused.
   warning: tracepoint 'scsi_zone_wp_update' is unused.
   warning: tracepoint 'scsi_prepare_zone_append' is unused.
   warning: tracepoint 'ata_sff_flush_pio_task' is unused.
   warning: tracepoint 'atapi_send_cdb' is unused.
   warning: tracepoint 'atapi_pio_transfer_data' is unused.
   warning: tracepoint 'ata_sff_pio_transfer_data' is unused.
   warning: tracepoint 'ata_sff_port_intr' is unused.
   warning: tracepoint 'ata_sff_hsm_command_complete' is unused.
   warning: tracepoint 'ata_sff_hsm_state' is unused.
   warning: tracepoint 'ata_bmdma_status' is unused.
   warning: tracepoint 'ata_bmdma_stop' is unused.
   warning: tracepoint 'ata_bmdma_start' is unused.
   warning: tracepoint 'ata_bmdma_setup' is unused.
   warning: tracepoint 'ata_exec_command' is unused.
   warning: tracepoint 'ata_tf_load' is unused.
   warning: tracepoint 'ice_tx_tstamp_complete' is unused.
   warning: tracepoint 'ice_tx_tstamp_fw_done' is unused.
   warning: tracepoint 'ice_tx_tstamp_fw_req' is unused.
   warning: tracepoint 'ice_tx_tstamp_request' is unused.
>> warning: tracepoint 'mlx5e_rep_neigh_update' is unused.
   warning: tracepoint 'xhci_dbc_giveback_request' is unused.
   warning: tracepoint 'xhci_dbc_queue_request' is unused.
   warning: tracepoint 'xhci_dbc_free_request' is unused.
   warning: tracepoint 'xhci_dbc_alloc_request' is unused.
   warning: tracepoint 'xhci_dbc_gadget_ep_queue' is unused.
   warning: tracepoint 'xhci_dbc_handle_transfer' is unused.
   warning: tracepoint 'xhci_dbc_handle_event' is unused.
   warning: tracepoint 'musb_req_deq' is unused.
   warning: tracepoint 'musb_req_enq' is unused.
   warning: tracepoint 'musb_req_start' is unused.
   warning: tracepoint 'musb_req_free' is unused.
   warning: tracepoint 'musb_req_alloc' is unused.
   warning: tracepoint 'musb_req_rx' is unused.
   warning: tracepoint 'musb_req_tx' is unused.
   warning: tracepoint 'musb_req_gb' is unused.
   warning: tracepoint 'ufshcd_wl_resume' is unused.
   warning: tracepoint 'ufshcd_wl_suspend' is unused.
   warning: tracepoint 'ufshcd_system_resume' is unused.
   warning: tracepoint 'ufshcd_system_suspend' is unused.
   warning: tracepoint 'br_mdb_full' is unused.
   warning: tracepoint 'tcp_hash_md5_mismatch' is unused.
   warning: tracepoint 'tcp_hash_md5_unexpected' is unused.
   warning: tracepoint 'devlink_hwerr' is unused.
   warning: tracepoint 'rpc_socket_reset_connection' is unused.
   warning: tracepoint 'rxrpc_rxgk_rekey' is unused.
   warning: tracepoint 'rxrpc_drop_ack' is unused.
   warning: tracepoint 'rxrpc_rx_response' is unused.
   warning: tracepoint 'rxrpc_rx_challenge' is unused.
   warning: tracepoint 'rxrpc_tx_challenge' is unused.
   warning: tracepoint 'cfg80211_return_u32' is unused.
   warning: tracepoint 'cfg80211_return_uint' is unused.
   warning: tracepoint 'cfg80211_chandef_dfs_required' is unused.
   warning: tracepoint 'cfg80211_send_rx_auth' is unused.
   warning: tracepoint 'rdev_return_void_tx_rx' is unused.
   warning: tracepoint 'rdev_resume' is unused.
   warning: tracepoint 'rdev_suspend' is unused.
   warning: tracepoint 'tipc_node_dump' is unused.
   warning: tracepoint '802154_rdev_resume' is unused.
   warning: tracepoint '802154_rdev_suspend' is unused.
   warning: tracepoint '802154_new_scan_event' is unused.
   warning: tracepoint '802154_drv_set_pan_coord' is unused.
>> warning: tracepoint 'batadv_dbg' is unused.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

